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

; Mail exchangers

; Servers

; Services

; load balancers

; Miscellaneous
_acme-challenge.wikitide.com.				TXT     "4fy8rTtTyh6OhF3ipd77YiIOEIouPGEuU0Wpi1WAVTM"
_acme-challenge.wikitide.com.				TXT     "r_r6x3c0rtxPwmAynj9apeJCcmXcN1GcE-7VWsczCNc"
_4892a2a9ab88b98b856acaa9af5215ae.static.wikitide.com.	CNAME	 _201b0baed920ec5e85ea9d4c9d96bd65.ycvykntjsl.acm-validations.aws.

; Other
