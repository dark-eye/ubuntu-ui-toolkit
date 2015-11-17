TEMPLATE = app
TARGET = $$PWD/gallery

SUBDIRS += po

filetypes = qml png svg js jpg qmlproject desktop

OTHER_FILES = ""

for(filetype, filetypes) {
  OTHER_FILES += *.$$filetype
}

OTHER_FILES += gallery

desktop_files.path = $$[QT_INSTALL_EXAMPLES]/ubuntu-ui-toolkit/examples/ubuntu-ui-toolkit-gallery
desktop_files.files = ubuntu-ui-toolkit-gallery.desktop

other_files.path = $$[QT_INSTALL_EXAMPLES]/ubuntu-ui-toolkit/examples/ubuntu-ui-toolkit-gallery
other_files.files = $$OTHER_FILES

INSTALLS += other_files desktop_files

