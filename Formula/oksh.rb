class Oksh < Formula
  desc "Portable OpenBSD Korn Shell"
  homepage "https://github.com/ibara/oksh"
  url "https://github.com/ibara/oksh/releases/download/20181009/oksh-20181009.tar.gz"
  sha256 "35dbd911ca129742e5a6cc31cd91055c2c26d895f19e9bafedf5d50b222d1197"

  head "https://github.com/ibara/oksh.git"

  def install
    args = %W[
      --prefix=#{prefix}
      --mandir=#{man}
      --enable-curses
    ]

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    assert_equal "42", shell_output("#{bin}/oksh -c 'printf 42'").strip
  end
end
