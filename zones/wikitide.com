$TTL 300
$ORIGIN wikitide.com.

@		SOA ns1.wikiforge.net. hostmaster.wikiforge.net. (
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
@		NS	ns1.wikiforge.net.
@		NS	ns2.wikiforge.net.

; CAA (issue: letsencrypt.com, iodef: mailto:sre@wikiforge.net)
@		TYPE257	\# 22 000569737375656C657473656E63727970742E6F7267
@		TYPE257	\# 31 0005696F6465666D61696C746F3A7372654077696B69666F7267652E6E6574

; Mail exchanges
@		MX	10	mail.wikitide.com.

; Mail policies
wikitide.com.		TXT	"v=spf1 ip4:3.133.225.104 -all"

; Mail autodiscovery
_imaps._tcp		IN SRV	0 0 143 mail.wikiforge.net.
_submission._tcp	IN SRV	0 0 587 mail.wikiforge.net.

;; DKIM - Policy: Mail may be signed. Not required.
mail._domainkey	TXT	"v=DKIM1; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6a1QYBQJP5JwhkhbFyXxfIpaXqw228Jf+vUAKKGIEIIEp61oYAplDAiYrlpCAhoBNmFIzwWnDr8vykFpaoXsouSFhN4trBKFOXFfKKIXlSBxLtR6P0C9dmgmpcjNACOTgK7lhrF0UmA5Om+ncJlU5BID7fE6PUB80iAshURt3DAvV976QCOsQrSmvcQZLX6xZ9YHVv2CtagEbcoPyn39LmAINva9/Cz8xyohMOzqVveMOsNPcxDJ6KYwM8C9emX7yvmG+xxbVGCPR0AGBzNYxbQMw8LMaqr3Kxx8RJfpTEjjtToh6GwY0XwhBvpqZ+cUXDHUfdrKJ2IxZrbDkken2QIDAQAB"

;; DMARC - Policy: Reject - unauthorised mail will not send, remote SMTPs will just drop the mail.
_dmarc		TXT	"v=DMARC1;p=quarantine;pct=100;fo=1"

; Servers

; Services
mail		A	3.133.225.104

; load balancers

; Miscellaneous
status		CNAME	wikitide.hund.io.

wikitide.com. 						TXT	"google-site-verification=mZqFWivIMI2uVbrLnmGJ96EHQeNjdypjcgWsoK1OgeQ"
_acme-challenge.wikitide.com.				TXT     "4fy8rTtTyh6OhF3ipd77YiIOEIouPGEuU0Wpi1WAVTM"
_acme-challenge.wikitide.com.				TXT     "r_r6x3c0rtxPwmAynj9apeJCcmXcN1GcE-7VWsczCNc"
_4892a2a9ab88b98b856acaa9af5215ae.static.wikitide.com.	CNAME	 _201b0baed920ec5e85ea9d4c9d96bd65.ycvykntjsl.acm-validations.aws.

; Other
