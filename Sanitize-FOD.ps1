$langs =
"ar-SA",
"bg-BG",
"cs-CZ",
"da-DK",
"de-DE",
"el-GR",
"en-GB",
"es-ES",
"es-MX",
"et-EE",
"fi-FI",
"fr-CA",
"fr-FR",
"he-IL",
"hr-HR",
"hu-HU",
"it-IT",
"ja-JP",
"ko-KR",
"lt-LT",
"lv-LV",
"nb-NO",
"nl-NL",
"pl-PL",
"pt-BR",
"pt-PT",
"ro-RO",
"ru-RU",
"sk-SK",
"sl-SI",
"sr-Latn-RS",
"sv-SE",
"th-TH",
"tr-TR",
"uk-UA",
"zh-CN",
"zh-TW",
"ar-SA",
"bg-BG",
"cs-CZ",
"da-DK",
"de-DE",
"el-GR",
"en-GB",
"es-ES",
"es-MX",
"et-EE",
"fi-FI",
"fr-CA",
"fr-FR",
"he-IL",
"hr-HR",
"hu-HU",
"it-IT",
"ja-JP",
"ko-KR",
"lt-LT",
"lv-LV",
"nb-NO",
"nl-NL",
"pl-PL",
"pt-BR",
"pt-PT",
"ro-RO",
"ru-RU",
"sk-SK",
"sl-SI",
"sr-Latn-RS",
"sv-SE",
"th-TH",
"tr-TR",
"uk-UA",
"zh-CN",
"zh-TW",
'af-za',
'as-in',
'az-latn',
'ba-ru',
'be-by',
'bn-bd',
'bn-in',
'bs-latn',
'ca-es',
'cy-gb',
'eu-es',
'fa-ir',
'fil-ph',
'ga-ie',
'gd-gb',
'gl-es',
'gu-in',
'ha-latn',
'hi-in',
'hy-am',
'id-id',
'ig-ng',
'is-is',
'ka-ge',
'kk-kz',
'kl-gl',
'kn-in',
'kok-deva',
'ky-kg',
'lb-lu',
'mi-nz',
'mk-mk',
'ml-in',
'mn-mn',
'mr-in',
'ms-bn',
'ms-my',
'mt-mt',
'ne-np',
'nn-no',
'nso-za',
'or-in',
'pa-in',
'ps-af',
'rm-ch',
'rw-rw',
'sah-ru',
'si-lk',
'sq-al',
'sr-cyrl',
'sw-ke',
'ta-in',
'te-in',
'tg-cyrl',
'tk-tm',
'tn-za',
'tt-ru',
'ug-cn',
'ur-pk',
'uz-latn',
'vi-vn',
'wo-sn',
'xh-za',
'yo-ng',
'zh-hk',
'zu-za'

foreach ($lang in $langs)
{
get-childitem -Path $PSScriptRoot | Where-object Name -like "*$lang*" | select-object -ExpandProperty Name | Remove-Item
}