{ lib, mkYarnPackage, fetchFromGitHub }:

mkYarnPackage rec {
  pname = "sql-language-server";
  version = "1.7.0";

  src = fetchFromGitHub {
    owner = "joe-re";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-u78Yq0ADwvJwAo7Zot4E/d6eBvzby18OzjWtHvGYMzo=";
  };

  packageJSON = "${src}/package.json";
  yarnLock = "${src}/yarn.lock";

  meta = with lib; {
    description = " SQL Language Server";
    homepage = "https://github.com/joe-re/sql-language-server";
    license = licenses.mit;
    maintainers = with maintainers; [ willswats ];
  };
}
