> # Attention
> This project is no longer maintained — learn more [here.](https://edgy.network/eol)

# gatekeeper

let's make the internet less sucks

## daftar

- [evilfactorylabs/gatekeeper steven-black-hosts](https://raw.githubusercontent.com/evilfactorylabs/gatekeeper/main/steven-black-hosts/alternates/fakenews-gambling/hosts) (> 85k hosts)
- [evilfactorylabs/gatekeeper native](https://raw.githubusercontent.com/evilfactorylabs/gatekeeper/main/native.txt) (< 500 hosts)
- [evilfactorylabs/gatekeeper ABPIndo (No element hide)](https://raw.githubusercontent.com/evilfactorylabs/gatekeeper/main/ABPIndo/subscriptions/abpindo_noelemhide.txt) (> 4k hosts)
- [AdGuard DNS filter](https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt) (> 40k hosts)
- [evilfactroylabs/gatekeeper AdGuard CNAME disguised trackers list](https://raw.githubusercontent.com/evilfactorylabs/gatekeeper/main/steven-black-hosts/data/Adguard-cname/hosts) (> 10k hosts)
- [evilfactorylabs/gatekeeper AdAway Default Blocklist](https://raw.githubusercontent.com/evilfactorylabs/gatekeeper/main/steven-black-hosts/data/adaway.org/hosts) (> 9k hosts)
- [Dan Pollock's List](https://raw.githubusercontent.com/evilfactorylabs/gatekeeper/main/steven-black-hosts/data/someonewhocares.org/hosts) (> 15k hosts)
- [oisd.nl](https://dbl.oisd.nl) (> 1m hosts)

## kategori yang diblokir

- jaringan iklan
- jaringan pelacak
- situs judi
- situs scam
- situs berita palsu
- os telemetry
- malware (dan "malvertising")
- spyware
- ransomware
- cryptojacking

## setup

evilfactorylabs tidak menyediakan pilihan query DNS melalui plain DNS karena rawan terkena spoofing, kecuali menggunakan koneksi
yang ter-enkripsi seperti via VPN ataupun proxy seperti SOCKS5 atau ShadowSocks, yang nanti kabarnya akan dibagikan disini.

Ada 4 cara yang bisa digunakan untuk menggunakan DNS Resolver dari evilfactorylabs, yakni via:

- DoH: https://edgy-dns.com/dns-query
- DoT: tls://edgy-dns.com:853
- DoQ: quic://edgy-dns.com:784

Cara paling sederhana bisa menggunakan [`dnsproxy`](https://github.com/AdguardTeam/dnsproxy) dari AdguardTeam yang mana ber-sumber kode terbuka, ditulis menggunakan Go, dan berjalan di lintas platform. Silahkan jalankan `dnsproxy` baik di foreground atapun via services, lalu gunakan 1 dari 3 pilihan diatas sebagai upstream. Contoh, bila ingin menggunakan DoQ (DNS Over QUIC) karena anaknya experimental, bisa menggunakan perintah berikut:

```
dnsproxy \
    -u https://edgy-dns.com/dns-query \
    -u tls://edgy-dns.com:853 \
    -u quic://edgy-dns.com:784
```

Lalu lakukan DNS query ke `coba.dong` dengan perintah berikut jika menggunakan `dig(1)`:

```
dig coba.dong
```

Jika jawabannya adalah 10.6.6.6, berarti dns query sudah dilakukan melalui edgyDNS! Namun jika yang muncul adalah alamat IP asing seperti 36.86.xx.xx, berarti query DNS somehow dijawab oleh ISP yang kamu gunakan :))

Pastikan DNS server yang digunakan (bisa di cek di `/etc/resolv.conf` atau sejenisnya) adalah ke 127.0.0.1 dan port 53 tersedia sebelum menjalankan `dnsproxy`.
