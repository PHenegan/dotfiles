{ ... }:
{
  services.pipewire.extraConfig = {
    pipewire = {
      "10-discord-devices" = {
        "context.modules" = [
          {
            name = "libpipewire-module-loopback";
            args = {
              "audio.position" = "MONO";
              "capture.props" = {
                "node.name" = "discord-input.capture";
                "node.description" = "Discord Input Capture";
                "target.object" = "NoiseTorch Microphone for Family 17h/19h/1ah HD Audio Controller";
              };
              "playback.props" = {
                "media.class" = "Audio/Source";
                "node.name" = "discord-input";
                "node.description" = "Discord Input";
              };
            };
          }
          {
            name = "libpipewire-module-loopback";
            args = {
              "audio.position" = "FL,FR";
              "capture.props" = {
                "media.class" = "Audio/Sink";
                "node.name" = "discord-output";
                "node.description" = "Discord Output";
              };
              "playback.props" = {
                "node.name" = "discord-output.playback";
                "node.description" = "Discord Output Monitor";
                "node.passive" = true;
              };
            };
          }
        ];
      };
    };
  };
}
