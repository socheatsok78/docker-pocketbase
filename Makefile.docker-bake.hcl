variable "DOCKER_META_IMAGES" {}
variable "DOCKER_META_VERSION" {}
variable "POCKETBASE_VERSION" {}

target "build"{
  //inherits = [ ]
  context = "./"
  dockerfile = "Dockerfile"
  platforms = [ "linux/amd64" ]
  tags = [ "${DOCKER_META_IMAGES}:${DOCKER_META_VERSION}" ]
  args = {
    DOCKER_META_IMAGES = "${DOCKER_META_IMAGES}"
    DOCKER_META_VERSION = "${DOCKER_META_VERSION}"
    POCKETBASE_VERSION = "${POCKETBASE_VERSION}"
  }
}
