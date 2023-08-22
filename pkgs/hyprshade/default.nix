{ lib
, buildPythonPackage
, fetchFromGitHub
, pdm
, pdm-backend
, more-itertools
, click
}:

buildPythonPackage rec {
  pname = "hyprshade";
  version = "v0.9.3";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "loqusion";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-ou072V9nZUqf5DEolkMQy979SjaZs4iOuoszw50k4Y8=";
  };

  propagatedBuildInputs = [ pdm pdm-backend more-itertools click ];

  meta = with lib;
    {
      homepage = "https://github.com/loqusion/hyprshade";
      description = "Hyprland shade configuration tool ";
      license = licenses.mit;
      # maintainers = with maintainers; [ ];
    };
}
