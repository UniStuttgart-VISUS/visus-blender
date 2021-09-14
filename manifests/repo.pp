# @summary Installs Blender from the software repository of the OS.
#
# @param package The name of the Blender package, which defaults to 'blender'.
define blender::repo(String $package = 'blender') {
    ensure_packages($package)
}