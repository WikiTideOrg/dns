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
@		MX	1	smtp.google.com.

; Mail policies
wikitide.com.		TXT	"v=spf1 include:_spf.google.com ~all"

; Mail autodiscovery
_imaps._tcp		IN SRV	0 0 993	imap.gmail.com.
_submission._tcp	IN SRV  0 0 587	smtp.gmail.com.

;; DKIM - Policy: Mail may be signed. Not required.
mail._domainkey		TXT	"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvn/JeGnNnhRHqyvuHEJxY87GckiFFGnx5lhWGY2oKJtt6yR74VXSi3UAonUIjlfkDl+KqrNZtRtTIVLsLU8eTx67xJGi5oOgdv2nu0EwOAbDU9EWZjoA1FrJKRfFLfyfkRhnXLX0WTIXs5v+lWz9FAva+E/muXBb5PRk0UpaiorN5oGXyX18T0Xdnmq07aG5TgNeQQgYX2hSxY9njb9Lpw8KDAqH2exczmtQP/dmY5Yc0UmvRcBSAQ8yc9RtAGtzcDzaidtjyyolyQDcYVcW4p8nv8Wzhr8/EKrS0qKq4WV5OfVfWhfPH+iFQ1mJPphN7IrH5vAlxudJQm72LAKDcwIDAQAB"

;; DMARC - Policy: Reject - unauthorized mail will not send, remote SMTPs will just drop the mail.
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
