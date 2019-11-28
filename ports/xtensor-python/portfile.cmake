vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO xtensor-stack/xtensor-python
    REF 4ffcfb7b5a4efa41d2cba1e2959ee35443a1d26a # version 0.23.1 commit on 2019.11.26
    SHA512 be707820cacc2cc33778335422f38da87d8707963a4b2b9f4cb6c95589fa207b854d34d1382a1d5cf91941d46b4d04e60df13ae132727c511dcaf1682641226c
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
