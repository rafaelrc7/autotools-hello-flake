{
  description = "Simple C Autotools flake template";

  outputs = { self }: {
    templates = {
      autotools = {
        path = ./autotools-hello;
        description = "Simple C Autotools flake template";
      };

    };

    defaultTemplate = self.templates.autotools;
  };
}

