require 'formula'

class GlibNetworking < Formula
  homepage 'https://launchpad.net/glib-networking'
  url 'http://ftp.gnome.org/pub/GNOME/sources/glib-networking/2.40/glib-networking-2.40.1.tar.xz'
  sha256 '9fb3e54d049a480afdb814ff7452e7ab67e5d5f607ade230d7713f19922b5a28'

  bottle do
    cellar :any
    sha1 "6b1d2dbdd8f9afa8df900dd84ebbedb4b37bc7a9" => :mavericks
    sha1 "f015f403d8ac4579c2d9547c208832eccd64dde4" => :mountain_lion
    sha1 "5fc71615593062f8ace776b5eebf6113cd655d1b" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'gnutls'
  depends_on 'gsettings-desktop-schemas'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-ca-certificates=#{etc}/openssl/cert.pem"
    system "make install"
  end
end
