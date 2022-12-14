variable "POCKETBASE_VERSION" {
  default = "0.10.1"
}

target "docker-metadata-action" {}

target "pocketbase" {
  inherits = ["docker-metadata-action"]
  context = "./"
  dockerfile = "Dockerfile"
  args = {
    POCKETBASE_VERSION = "${POCKETBASE_VERSION}"
  }
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
