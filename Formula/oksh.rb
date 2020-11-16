class Oksh < Formula
  desc "Portable OpenBSD Korn Shell"
  homepage "https://github.com/ibara/oksh"
  url "https://github.com/ibara/oksh/releases/download/oksh-6.8.1/oksh-6.8.1.tar.gz"
  sha256 "ddd2b27b99009a4ee58ddf58da73edf83962018066ccf33b2fe1f570a00917b0"

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
