class Oksh < Formula
  desc "Portable OpenBSD Korn Shell"
  homepage "https://github.com/ibara/oksh"
  url "https://github.com/ibara/oksh/releases/download/oksh-6.6/oksh-6.6.tar.gz"
  sha256 "573d56d5eaeb4a89a8e1ff4638bdff7e44a7ebeb8a9a36b121d4c6fa2acd62ff"

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
