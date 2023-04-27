
# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.fish.inc' ]; . '$HOME/google-cloud-sdk/path.fish.inc'; end

# Setting PATH for Python 3.9
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"

# Mac App Store build location
alias tailscale=/Applications/Tailscale.app/Contents/MacOS/Tailscale