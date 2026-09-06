{
  homeManager.modules.base = {
    programs.sesh = {
      enable = true;
      settings = {
        session = [
          {
            name = "Config";
            path = "/etc/nixos";
            startup_command = "tmux split-window -h && tmux send-keys -t 1 'opencode' C-m && tmux select-pane -t 0 && tmux split-window -v -p 25 && tmux select-pane -t 0";
          }
          {
            name = "Projects";
            path = "~/projects/*";
            startup_command = "tmux split-window -h && tmux send-keys -t 1 'opencode' C-m && tmux select-pane -t 0 && tmux split-window -v -p 25 && tmux select-pane -t 0";
          }
        ];
      };
    };
  };
}
