locals {
  dns_name = "chuckdantonio.com."
}

resource "google_dns_managed_zone" "chuckdantonio_com" {
  name        = "chuckdantonio-com"
  dns_name    = local.dns_name
  description = "Domain for chuckdantonio.com services"

  dnssec_config {
    state = "on"
  }
}

resource "google_dns_record_set" "chuckdantonio_com_caa" {
  name         = google_dns_managed_zone.chuckdantonio_com.dns_name
  managed_zone = google_dns_managed_zone.chuckdantonio_com.name
  type         = "CAA"
  ttl          = 300

  rrdatas = [
    "0 issue \"letsencrypt.org\""
  ]
}

resource "google_dns_record_set" "chuckdantonio_com_mx" {
  name         = google_dns_managed_zone.chuckdantonio_com.dns_name
  managed_zone = google_dns_managed_zone.chuckdantonio_com.name
  type         = "MX"
  ttl          = 300

  rrdatas = [
    "10 aspmx.l.google.com.",
    "20 alt1.aspmx.l.google.com.",
    "30 alt2.aspmx.l.google.com.",
    "40 aspmx2.googlemail.com.",
    "50 aspmx3.googlemail.com."
  ]
}

resource "google_dns_record_set" "chuckdantonio_com_txt" {
  name         = google_dns_managed_zone.chuckdantonio_com.dns_name
  managed_zone = google_dns_managed_zone.chuckdantonio_com.name
  type         = "TXT"
  ttl          = 300

  rrdatas = [
    "\"v=spf1 include:_spf.google.com ~all\"",
    "google-site-verification=BYqw8ki-ZzEwpxWIZUI-XF2KwE3_9hxzUcJRJSz16fI"
  ]
}

resource "google_dns_record_set" "blog" {
  name         = "blog." + google_dns_managed_zone.chuckdantonio_com.dns_name
  managed_zone = google_dns_managed_zone.chuckdantonio_com.name
  type         = "CNAME"
  ttl          = 300

  rrdatas = [
    "cdant.io"
  ]
}

resource "google_dns_record_set" "www" {
  name         = "www." + google_dns_managed_zone.chuckdantonio_com.dns_name
  managed_zone = google_dns_managed_zone.chuckdantonio_com.name
  type         = "CNAME"
  ttl          = 300

  rrdatas = [
    "crdant.io"
  ]
}

