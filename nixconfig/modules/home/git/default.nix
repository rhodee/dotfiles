{ pkgs, ... }:
{
  home.file.".gitmessage.txt" = {
    source = ./gitmessage.txt;
    recursive = false;
  };

  catppuccin.lazygit.enable = true;

  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      gui = {
        # Catppuccin Mocha theme
        theme = {
          activeBorderColor = [ "#89b4fa" "bold" ];
          inactiveBorderColor = [ "#6c7086" ];
          optionsTextColor = [ "#89dceb" ];
          selectedLineBgColor = [ "#45475a" ];
          cherryPickedCommitBgColor = [ "#45475a" ];
          cherryPickedCommitFgColor = [ "#89b4fa" ];
          unstagedChangesColor = [ "#f38ba8" ];
          defaultFgColor = [ "#cdd6f4" ];
          searchingActiveBorderColor = [ "#f9e2af" "bold" ];
        };

        showListFooter = true;
        showRandomTip = true;
        showBranchCommitHash = true;
        showBottomLine = false;
        showCommandLog = false;
        showFileTree = true;
        showIcons = true;
        nerdFontsVersion = "3";
        commitLength = {
          show = true;
        };
        mouseEvents = true;
        skipDiscardChangeWarning = false;
        skipStashWarning = false;
        sidePanelWidth = 0.3333;
        expandFocusedSidePanel = false;
        mainPanelSplitMode = "flexible";
        enlargedSideViewLocation = "left";
        language = "auto";
        timeFormat = "02 Jan 06";
        shortTimeFormat = "3:04PM";
        border = "rounded";
        animateExplosion = true;
        portraitMode = "auto";
        filterMode = "fuzzy";
      };

      git = {
        pagers = [
          {
            colorArg = "always";
            pager = "delta --dark --paging=never --line-numbers";
          }
          {
            externalDiffCommand = "difft --display=inline";
          }
        ];

        commit = {
          signOff = false;
          autoWrapCommitMessage = true;
          autoWrapWidth = 72;
        };

        merging = {
          args = "--no-ff";
          manualCommit = false;
          squashMergeMessage = "Squash merge {{selectedRef}} into {{currentBranch}}";
        };

        log = {
          order = "topo-order";
          showGraph = "always";
          showWholeGraph = false;
        };

        autoFetch = true;
        autoRefresh = true;
        fetchAll = true;
        branchLogCmd = "git log --graph --color=always --abbrev-commit --decorate --date=relative --pretty=medium {{branchName}} --";
        overrideGpg = false;
        disableForcePushing = false;
        commitPrefixes = { };
        parseEmoji = true;
        truncateCopiedCommitHashesTo = 12;

        pull = {
          mode = "rebase";
        };

        allBranchesLogCmds = [
          "git log --graph --all --color=always --abbrev-commit --decorate --date=relative --pretty=medium"
        ];
      };

      update = {
        method = "prompt";
        days = 7;
      };

      refresher = {
        refreshInterval = 10;
        fetchInterval = 60;
      };

      confirmOnQuit = false;
      notARepository = "prompt";
      promptToReturnFromSubprocess = true;

      customCommands = [
        {
          key = "P";
          context = "global";
          description = "🚀 Push to origin (like git po)";
          command = "git push origin {{.SelectedLocalBranch.Name}}";
          loadingText = "Pushing to origin...";
        }
        {
          key = "U";
          context = "global";
          description = "⬇️  Pull rebase from origin (like git pro)";
          command = "git pull --rebase origin {{.SelectedLocalBranch.Name}}";
          loadingText = "Pulling with rebase...";
        }
        {
          key = "<c-f>";
          context = "global";
          description = "📥 Fetch origin (like git fo)";
          command = "git fetch origin";
          loadingText = "Fetching from origin...";
        }
        {
          key = "R";
          context = "localBranches";
          description = "🔄 Remote update prune (like git up)";
          command = "git remote update --prune";
          loadingText = "Updating remotes...";
        }
        {
          key = "H";
          context = "commits";
          description = "📜 View commit history (like git hist)";
          command = ''git log --pretty=format:"%h -- %s [%cd, %cn, %cr]" --stat -42 --graph --date=short {{.SelectedLocalCommit.Sha}}'';
          output = "terminal";
        }
        {
          key = "<c-d>";
          context = "commits";
          description = "🔍 Difftastic view";
          command = "git difftool {{.SelectedLocalCommit.Sha}}~1 {{.SelectedLocalCommit.Sha}}";
          output = "terminal";
        }
        {
          key = "O";
          context = "commits";
          description = "😬 Oops! (soft reset, like git oops)";
          command = "git reset --soft HEAD^";
        }
      ];

      os = {
        editPreset = "nvim";
        edit = "nvim {{filename}}";
        editAtLine = "nvim +{{line}} {{filename}}";
        editAtLineAndWait = "nvim +{{line}} {{filename}}";
        open = "open {{filename}}";
        openLink = "open {{link}}";
      };
    };
  };

  home.shellAliases = {
    g = "git";
  };

  programs.delta = {
    enable = true;
    options = {
      features = "catppuccin-macchiato";
      line-numbers = true;
      navigate = true;
      interactive = {
        keep-plus-minus-markers = false;
      };
    };
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "rhodee";
        email = "info@rhodee.us";
      };

      alias = {
        co = "checkout";
        ci = "commit";
        cl = "clone";
        po = "push origin";
        pro = "pull --rebase origin";
        fo = "fetch origin";
        rem = "remote -v";
        rshow = "remote show origin";
        st = "status --short --branch --ignore-submodules";
        br = "branch -i";
        cp = "cherry-pick";
        merff = "merge --ff-only";
        up = "remote update --prune";
        tag = "tag -a";
        aa = "add --all";
        au = "add -u";
        ap = "add --patch";
        # stash operations
        sl = "stash list";
        sa = "stash apply";
        ss = "stash save";
        ssh = "stash show -p";
        diff = "!f() { git diff --color-words --ignore-all-space $1..$2; }; f";
        dft = "difftool";
        # find git tracked-files
        f = "!git ls-files | grep -i";
        get = "grep --color=auto --break --ignore-case -Ii --untracked --before-context 1 --after-context 2 -e";
        # view logs
        last = "log -1 HEAD --stat";
        l = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        hist = "!git l --pretty=format:\"%h -- %s [%cd, %cn, %cr]\" --stat -42 --graph --date=short";
        lg = "!git l -C --stat --decorate";
        lgp = "!git l -C --stat -p --decorate";
        rl = "reflog --format=reflog --date=format:'%Y-%m-%d %H:%m'";
        # rollback
        oops = "reset --soft \"HEAD^\"";
        unstage = "reset HEAD";
        shit = "!gitk --all $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )";
      };

      help.autocorrect = "prompt";

      url."git@github.com:rhodee/".insteadOf = "me:";
      url."ssh://git@github.com/rhodee/".insteadOf = "https://github.com/rhodee/";
      url."ssh://git@github.com/".insteadOf = "https://github.com/";

      color = {
        ui = "auto";
        branch = {
          current = "cyan reverse";
          local = "yellow";
          remote = "green";
        };
        diff = {
          meta = "yellow bold";
          frag = "magenta bold";
          old = "red bold";
          new = "green bold";
        };
        status = {
          added = "yellow";
          changed = "green";
          untracked = "cyan";
        };
        diff-highlight = {
          oldNormal = "red bold";
          oldHighlight = "red bold 52";
          newNormal = "green bold";
          newHighlight = "green bold 22";
        };
      };

      advice.statusHints = false;
      column.ui = "auto";

      commit = {
        template = "~/.gitmessage.txt";
        verbose = true;
      };

      pager = {
        diff = "delta";
        log = "delta";
        reflog = "delta";
        show = "delta";
      };

      interactive.diffFilter = "delta --color-only";

      core = {
        excludesfile = "~/.gitignore_global";
        quotepath = false;
        whitespace = "-trailing-space,space-before-tab";
        autocrlf = false;
        legacyheaders = false;
        pager = "delta";
      };

      receive.denyNonFastForwards = true;

      fetch = {
        prune = true;
        prunetags = true;
      };

      push = {
        default = "current";
        followTags = true;
        autoSetupRemote = true;
      };

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      status.showUntrackedFiles = "all";

      grep = {
        extendedRegexp = true;
        lineNumber = true;
      };

      branch = {
        autoSetupRebase = "remote";
        sort = "-committerdate";
      };

      tag.sort = "version:refname";

      pull = {
        ff = "only";
        rebase = "only";
      };

      rebase = {
        autosquash = true;
        autostash = true;
        updateRefs = true;
      };

      merge.conflictstyle = "zdiff3";
      mergetool.prompt = true;

      diff = {
        external = "difft";
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };

      difftool = {
        prompt = false;
        difftastic.cmd = "difft \"$LOCAL\" \"$REMOTE\"";
      };

      filter.lfs = {
        required = true;
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
      };

      sequence.editor = "interactive-rebase-tool";
      gpg.program = "gpg";
      init.defaultBranch = "main";

      pretty.reflog = "%C(auto)%h %gd%d %gs %C(240)%as%C(auto)";
    };
  };

  home.packages = with pkgs; [
    git-absorb
    git-extras
    git-interactive-rebase-tool
    gnupg
  ];
}
