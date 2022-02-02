# @summary Installs Blender from the Blender website.
#
# @param dependencies A list of packages that need to be installed in order for
#                     Blender to work. This is usually provided via Hiera.
# @param destination The directory to install Blender to.
# @param source The URL to retrieve Blender from. If not set, the URL will be
#               composed from the requested version.
# @param version The (full) version of Blender to be installed. This is required
#                to determine the download URL automatically and to decide on
#                the installation location including the symlink in
#                '/usr/local/bin'.
define blender::download(
        Array[String] $dependencies,
        String $destination,
        Optional[String] $source = undef,
        String $version,
        String $ensure = 'present'
        ) {

    # Install dependencies for Blender.
    ensure_packages($dependencies)

    # Determine version without revision number.
    $versions = split($version, /\./)
    $major_version = $versions[0]
    $minor_version = $versions[1]
    $install_version = "${major_version}.${minor_version}"

    # Resolve the actual remote location of the sources.
    $url = if $source {
        $source
    } else {
        "https://ftp.halifax.rwth-aachen.de/blender/release/Blender${install_version}/blender-${version}-linux-x64.tar.xz"
    }

    # Download and extract the sources.
    $archive = basename($url)
    $preliminary_install_name = basename($archive, '.*')
    $install_name = if ($preliminary_install_name.stdlib::end_with('tar')) {
        basename($preliminary_install_name, '.*')
    } else {
        $preliminary_install_name
    }
    $install_dir = "${destination}/${install_name}"

    archive { "${desintation}/${archive}":
        ensure => $ensure,
        source => $url,
        extract => true,
        extract_path => $destination,
        creates => $install_dir,
        cleanup => true,
        user => 'root',
        group => 'root',
    }
    ~> file { "/usr/local/bin/blender-${install_version}":
        ensure => if ($ensure != 'absent') { 
            'link'
        } else {
            $ensure
        },
        target => "${install_dir}/blender"
    }
}