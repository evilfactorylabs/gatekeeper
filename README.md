# gatekeeper

makes the internet less sucks

## daftar

- [evilfactorylabs/gatekeeper steven-black-hosts](https://raw.githubusercontent.com/evilfactorylabs/gatekeeper/main/steven-black-hosts/alternates/fakenews-gambling/hosts) (> 63k hosts)
- [evilfactorylabs/gatekeeper native](https://raw.githubusercontent.com/evilfactorylabs/gatekeeper/main/native.txt) (< 50 hosts)
- [AdGuard DNS filter](https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt) (> 40k hosts)
- [AdAway Default Blocklist](https://adaway.org/hosts.txt) (> 9k hosts)
- [Dan Pollock's List](https://someonewhocares.org/hosts/zero/hosts) (> 14k hosts)
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

- DoH: https://dns.edgy.network/dns-query
- DoH (anycast)*: https://anycast.dns.edgy.network/dns-query
- DoT: tls://dns.edgy.network:853
- DoQ: quic://dns.edgy.network:784

Cara paling sederhana bisa menggunakan [`dnsproxy`](https://github.com/AdguardTeam/dnsproxy) dari AdguardTeam yang mana ber-sumber kode terbuka, ditulis menggunakan Go, dan berjalan di lintas platform. Silahkan jalankan `dnsproxy` baik di foreground atapun via services, lalu gunakan 1 dari 3 pilihan diatas sebagai upstream. Contoh, bila ingin menggunakan DoQ (DNS Over QUIC) karena anaknya experimental, bisa menggunakan perintah berikut:

```
dnsproxy -u quic://dns.edgy.network:784
```

Lalu lakukan DNS query ke `coba.dong` dengan perintah berikut jika menggunakan `dig(1)`:

```
dig coba.dong
```

Jika jawabannya adalah alamat ip dari subnet 10.0.0.0/8 (e.g: 10.6.6.6), berarti dns query sudah dilakukan melalui edgy DNS! Namun jika yang muncul adalah alamat IP asing seperti 36.86.xx.xx, berarti query DNS dijawab oleh ISP yang kamu gunakan :))

Pastikan DNS server yang digunakan (bisa di cek di `/etc/resolv.conf` atau sejenisnya) adalah ke 127.0.0.1 dan port 53 tersedia sebelum menjalankan `dnsproxy`.

---

*cocok untuk yang menggunakan *exit node* di luar Asia Tenggara
