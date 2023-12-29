$TTL 300
$ORIGIN wikitide.com.

@		SOA ns1.wikitide.net. hostmaster.wikitide.net. (
		20230609000001	; serial
		7200		; refresh
		30M		; retry
		3D		; expire
		900		; ncache
)

; Wildcard services
@		DYNA	geoip!cp
*		DYNA	geoip!cp

; Name servers
@		NS	ns1.wikitide.net.
@		NS	ns2.wikitide.net.

; CAA (issue: letsencrypt.com, iodef: mailto:sre@wikitide.org)
@		TYPE257	\# 22 000569737375656C657473656E63727970742E6F7267
@		TYPE257	\# 31 0005696F6465666D61696C746F3A7372654077696B69666F7267652E6E6574

; Mail exchanges
; @		MX	10	mail.wikitide.net.
@		MX	1	smtp.google.com.

; Mail policies
; wikitide.com.		TXT	"v=spf1 ip4:63.141.240.5 ip6:2604:4300:a:24::110 -all"
wikitide.com.		TXT	"v=spf1 include:_spf.google.com ~all"

; Mail autodiscovery
_imaps._tcp		IN SRV	0 0 143 mail.wikitide.net.
_submission._tcp	IN SRV	0 0 587 mail.wikitide.net.

;; DKIM - Policy: Mail may be signed. Not required.
mail._domainkey	TXT	"v=DKIM1; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6a1QYBQJP5JwhkhbFyXxfIpaXqw228Jf+vUAKKGIEIIEp61oYAplDAiYrlpCAhoBNmFIzwWnDr8vykFpaoXsouSFhN4trBKFOXFfKKIXlSBxLtR6P0C9dmgmpcjNACOTgK7lhrF0UmA5Om+ncJlU5BID7fE6PUB80iAshURt3DAvV976QCOsQrSmvcQZLX6xZ9YHVv2CtagEbcoPyn39LmAINva9/Cz8xyohMOzqVveMOsNPcxDJ6KYwM8C9emX7yvmG+xxbVGCPR0AGBzNYxbQMw8LMaqr3Kxx8RJfpTEjjtToh6GwY0XwhBvpqZ+cUXDHUfdrKJ2IxZrbDkken2QIDAQAB"

;; DMARC - Policy: Reject - unauthorised mail will not send, remote SMTPs will just drop the mail.
_dmarc		TXT	"v=DMARC1;p=quarantine;pct=100;fo=1"

; BIMI - Used for verified emails
default._bimi	TXT	"v=BIMI1;l=https://static.wikitide.net/commonswiki/e/ea/WikiTide_BIMI.svg;a="

; Servers

; Services

; load balancers

; Miscellaneous
status		CNAME	wikitide.hund.io.

wikitide.com. 						TXT	"google-site-verification=pEDqFUibcZHCnuTh60erG86iP_p-UmJhVZ3pjcO4ahg"
_acme-challenge.wikitide.com.				TXT     "e216bMRC1RyZJBc0q6kLgzW82H9zhHlr0YhHa63i9f8"
_4892a2a9ab88b98b856acaa9af5215ae.static.wikitide.com.	CNAME	 _201b0baed920ec5e85ea9d4c9d96bd65.ycvykntjsl.acm-validations.aws.

; Other
