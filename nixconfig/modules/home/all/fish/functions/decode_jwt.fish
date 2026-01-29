function decode_base64url
    set -l input $argv[1]
    set -l padded (string replace -a -- '-' '+' $input | string replace -a -- '_' '/')

    # Add padding if needed
    set -l mod (math (string length $padded) % 4)
    if test $mod -eq 2
        set padded "$padded=="
    else if test $mod -eq 3
        set padded "$padded="
    end

    echo $padded | base64 -d 2>/dev/null
end

function decode_jwt --description 'Decode a JWT token and display header, payload, and metadata'
    set -l token

    if test (count $argv) -gt 0
        set token $argv[1]
    else if not isatty stdin
        read token
    end

    if test -z "$token"
        echo "Usage: decode_jwt <jwt-token>"
        echo "       echo <jwt_token> | decode_jwt"
        return 1
    end

    # Split token into parts
    set -l parts (string split '.' $token)

    if test (count $parts) -ne 3
        echo "Error: Invalid JWT format (expected 3 parts separated by '.')"
        return 1
    end

    set -l header $parts[1]
    set -l payload $parts[2]
    set -l signature $parts[3]

    echo "═══════════════════════════════════════════════════════════════"
    echo "                         JWT DECODED"
    echo "═══════════════════════════════════════════════════════════════"
    echo ""

    # Decode and display header
    set_color cyan
    echo "┌─ HEADER ─────────────────────────────────────────────────────"
    set_color normal
    set -l header_json (decode_base64url $header)
    if command -q jq
        echo $header_json | jq -C '.'
    else
        echo $header_json
    end
    echo ""

    # Decode and display payload
    set_color green
    echo "┌─ PAYLOAD ────────────────────────────────────────────────────"
    set_color normal
    set -l payload_json (decode_base64url $payload)
    if command -q jq
        echo $payload_json | jq -C '.'
    else
        echo $payload_json
    end
    echo ""

    # Parse timestamps if jq is available
    if command -q jq
        set -l iat (echo $payload_json | jq -r '.iat // empty')
        set -l exp (echo $payload_json | jq -r '.exp // empty')
        set -l nbf (echo $payload_json | jq -r '.nbf // empty')

        if test -n "$iat" -o -n "$exp" -o -n "$nbf"
            set_color yellow
            echo "┌─ TIMESTAMPS ─────────────────────────────────────────────────"
            set_color normal

            if test -n "$iat"
                set -l iat_date (date -r $iat 2>/dev/null || date -d @$iat 2>/dev/null)
                echo "  Issued At (iat):    $iat_date"
            end

            if test -n "$exp"
                set -l exp_date (date -r $exp 2>/dev/null || date -d @$exp 2>/dev/null)
                set -l now (date +%s)
                if test $exp -lt $now
                    set_color red
                    echo "  Expires (exp):      $exp_date [EXPIRED]"
                    set_color normal
                else
                    set -l remaining (math $exp - $now)
                    set -l hours (math "floor($remaining / 3600)")
                    set -l mins (math "floor(($remaining % 3600) / 60)")
                    echo "  Expires (exp):      $exp_date [valid for {$hours}h {$mins}m]"
                end
            end

            if test -n "$nbf"
                set -l nbf_date (date -r $nbf 2>/dev/null || date -d @$nbf 2>/dev/null)
                echo "  Not Before (nbf):   $nbf_date"
            end
            echo ""
        end
    end

    # Display signature info
    set_color magenta
    echo "┌─ SIGNATURE ────────────────────────────────────────────────────"
    set_color normal
    echo "  Length: "(string length $signature)" chars (base64url encoded)"
    echo "  Value:  "(string sub -l 40 $signature)"..."
    echo ""

    echo "═══════════════════════════════════════════════════════════════"
end
