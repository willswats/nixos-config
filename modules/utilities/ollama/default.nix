{ ... }:

{
  services.ollama = {
    enable = true;
    # Optional: load models on startup
    loadModels = [ "deepseek-r1:14b" ];
  };
}
