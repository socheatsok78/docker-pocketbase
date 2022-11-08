target "docker-metadata-action" {}
target "github-metadata-action" {}

target "build" {
  inherits = ["docker-metadata-action", "github-metadata-action"]
  context = "./"
  dockerfile = "Dockerfile"
  platforms = [
    "linux/amd64",
    # "linux/arm64"
  ]
}
