# @summary Installs Blender.
#
# Installs the 3D creation tool Blender.
#
# @param download_version If not empty, instructs the module to install the
#                         specified (full) version Blender from the Blender
#                         website. Attributes in the hash are the parameters for
#                         the blender::download resource.
# @param download_dependencies A list of packages to be installed if Blender is
#                              downloaded from blender.org. This parameter has
#                              no effect if Blender is installed from the
#                              package repository. Defaults are provided via
#                              Hiera.
# @param download_destination The folder where downloaded versions of Blender
#                             are installed. This parameter has no effect if
#                             Blender is installed from the package repository.
#
# @example Install the version of Blender that is available in the OS package repo.
#    include blender
#
# @example Install Blender 2.93.4 from the Blender website.
#    class { 'blender':
#        download_versions => {
#            '2.93.4' => { }
#        }
#    }
#
# @author Christoph Müller
#
class blender(
        Hash[String, Hash[String, Variant[String, Integer, Boolean]]] $download_versions = { },
        Array[String] $download_dependencies = [],
        String $download_destination,
    ) {

    if (empty($download_versions)) {
        # If no specific version were requested, install from repo.
        blender::repo { 'blender':
        }        

    } else {
        # Install all of the requested versions from blender.org.
        $download_versions.each | $version, $attributes | {
            notify { "Blender ${version} ...": }

            blender::download { "blender-${version}":
                version => $version,
                dependencies => $download_dependencies,
                destination => $download_destination,
                * => $attributes
            }
        }
    }
}
