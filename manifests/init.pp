class repo-remi {
    file {
        '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi' :
            content => '-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.7 (GNU/Linux)

mQGiBEJny1wRBACRnbQgZ6qLmJSuGvi/EwrRL6aW610BbdpLQRL3dnwy5wI5t9T3
/JEiEJ7GTvAwfiisEHifMfk2sRlWRf2EDQFttHyrrYXfY5L6UAF2IxixK5FL7PWA
/2a7tkw1IbCbt4IGG0aZJ6/xgQejrOLi4ewniqWuXCc+tLuWBZrGpE2QfwCggZ+L
0e6KPTHMP97T4xV81e3Ba5MD/3NwOQh0pVvZlW66Em8IJnBgM+eQh7pl4xq7nVOh
dEMJwVU0wDRKkXqQVghOxALOSAMapj5mDppEDzGLZHZNSRcvGEs2iPwo9vmY+Qhp
AyEBzE4blNR8pwPtAwL0W3cBKUx7ZhqmHr2FbNGYNO/hP4tO2ochCn5CxSwAfN1B
Qs5pBACOkTZMNC7CLsSUT5P4+64t04x/STlAFczEBcJBLF1T16oItDITJmAsPxbY
iee6JRfXmZKqmDP04fRdboWMcRjfDfCciSdIeGqP7vMcO25bDZB6x6++fOcmQpyD
1Fag3ZUq2yojgXWqVrgFHs/HB3QE7UQkykNp1fjQGbKK+5mWTrQkUmVtaSBDb2xs
ZXQgPFJQTVNARmFtaWxsZUNvbGxldC5jb20+iGAEExECACAFAkZ+MYoCGwMGCwkI
BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRAATm9HAPl/Vv/UAJ9EL8ioMTsz/2EPbNuQ
MP5Xx/qPLACeK5rk2hb8VFubnEsbVxnxfxatGZ25AQ0EQmfLXRAEANwGvY+mIZzj
C1L5Nm2LbSGZNTN3NMbPFoqlMfmym8XFDXbdqjAHutGYEZH/PxRI6GC8YW5YK4E0
HoBAH0b0F97JQEkKquahCakj0P5mGuH6Q8gDOfi6pHimnsSAGf+D+6ZwAn8bHnAa
o+HVmEITYi6s+Csrs+saYUcjhu9zhyBfAAMFA/9Rmfj9/URdHfD1u0RXuvFCaeOw
CYfH2/nvkx+bAcSIcbVm+tShA66ybdZ/gNnkFQKyGD9O8unSXqiELGcP8pcHTHsv
JzdD1k8DhdFNhux/WPRwbo/es6QcpIPa2JPjBCzfOTn9GXVdT4pn5tLG2gHayudK
8Sj1OI2vqGLMQzhxw4hJBBgRAgAJBQJCZ8tdAhsMAAoJEABOb0cA+X9WcSAAn11i
gC5ns/82kSprzBOU0BNwUeXZAJ0cvNmY7rvbyiJydyLsSxh/la6HKw==
=6Rbg
-----END PGP PUBLIC KEY BLOCK-----',
            group => 'root',
            mode => 0644,
            owner => 'root',
            ;
    }

    yumrepo {
        'remi' :
            descr => 'Les RPM de remi pour Enterprise Linux $releasever - $basearch',
            #baseurl => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/',
            mirrorlist => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror',
            enabled => '1',
            gpgcheck => '1',
            gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
            failovermethod => 'priority',
            require => [
                File['/etc/pki/rpm-gpg/RPM-GPG-KEY-remi'],
            ],
            ;
        'remi-test' :
            descr => 'Les RPM de remi en test pour Enterprise Linux $releasever - $basearch',
            #baseurl => 'http://rpms.famillecollet.com/enterprise/$releasever/test/$basearch/',
            mirrorlist => 'http://rpms.famillecollet.com/enterprise/$releasever/test/mirror',
            enabled => '0',
            gpgcheck => '1',
            gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
            require => [
                File['/etc/pki/rpm-gpg/RPM-GPG-KEY-remi'],
            ],
            ;
    }
}
