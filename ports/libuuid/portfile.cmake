vcpkg_fail_port_install(MESSAGE "${PORT} currently only supports unix platform" ON_TARGET "Windows" "UWP")

set(LIBUUID_VERSION 1.0.3)
vcpkg_download_distfile(ARCHIVE
    URLS "http://sourceforge.net/projects/libuuid/files/libuuid-1.0.3.tar.gz"
    FILENAME libuuid-1.0.3.tar.gz
    SHA512 77488caccc66503f6f2ded7bdfc4d3bc2c20b24a8dc95b2051633c695e99ec27876ffbafe38269b939826e1fdb06eea328f07b796c9e0aaca12331a787175507
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

file(COPY
    ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt
    ${CMAKE_CURRENT_LIST_DIR}/config.linux.h
    DESTINATION ${SOURCE_PATH}
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

set(prefix ${CURRENT_INSTALLED_DIR})
set(exec_prefix \$\{prefix\})
set(libdir \$\{exec_prefix\}/lib)
set(includedir \$\{prefix\}/include)
configure_file(${SOURCE_PATH}/uuid.pc.in ${SOURCE_PATH}/uuid.pc @ONLY)
file(INSTALL ${SOURCE_PATH}/uuid.pc DESTINATION ${CURRENT_PACKAGES_DIR}/lib/pkgconfig)
file(INSTALL
    ${SOURCE_PATH}/COPYING
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

vcpkg_copy_pdbs()
