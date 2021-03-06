require 'package'

class Lz4 < Package
  version '1.7.5'
  source_url 'https://github.com/lz4/lz4/archive/v1.7.5.tar.gz'
  source_sha1 'a710a7d45beb0951806d2b98f0c1739107e97c14'

  def self.build
    if `uname -m`.strip == "x86_64"
      system "make", "PREFIX=/usr/local", "libdir=/usr/local/lib64"
    else
      system "make", "PREFIX=/usr/local", "libdir=/usr/local/lib"
    end
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install" 
  end
end
