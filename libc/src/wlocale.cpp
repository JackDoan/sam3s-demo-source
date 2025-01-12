// wlocale -- class locale wide member functions
#include <istream>

 #if _IS_EMBEDDED

 #else /* _IS_EMBEDDED */
#include <locale>
_STD_BEGIN

typedef char_traits<wchar_t> _Wtraits;
typedef istreambuf_iterator<wchar_t, _Wtraits> _Winiter;
typedef ostreambuf_iterator<wchar_t, _Wtraits> _Woutiter;

	// facets associated with C categories
#define ADDFAC(Facet, cat, ptrimp, ptrloc) \
	if ((_CATMASK(Facet::_Getcat()) & cat) == 0) \
		; \
	else if (ptrloc == 0) \
		ptrimp->_Addfac(_NEW_CRT Facet(lobj), Facet::id); \
	else \
		ptrimp->_Addfac((locale::facet *)&_USE(*ptrloc, Facet), Facet::id);

// moved from locale to ease subsetting
typedef ctype<wchar_t> _Tw1;
typedef num_get<wchar_t, _Winiter> _Tw2;
typedef num_put<wchar_t, _Woutiter> _Tw3;
typedef numpunct<wchar_t> _Tw4;
typedef collate<wchar_t> _Tw5;
typedef messages<wchar_t> _Tw6;
typedef money_get<wchar_t, _Winiter> _Tw7;
typedef money_put<wchar_t, _Woutiter> _Tw9;
typedef moneypunct<wchar_t, false> _Tw11;
typedef moneypunct<wchar_t, true> _Tw12;
typedef time_get<wchar_t, _Winiter> _Tw13;
typedef time_put<wchar_t, _Woutiter> _Tw14;
//....
typedef codecvt<wchar_t, char, _Mbstatet> _Twc1;
locale::id ctype<wchar_t>::id(0);
template<> locale::id time_put<wchar_t, _Woutiter>::id(0);



void locale::_Locimp::_Makewloc(const _Locinfo& lobj,
	locale::category cat, _Locimp *ptrimp, const locale *ptrloc)
	{	// setup wide part of a new locale
	ADDFAC(_Tw1, cat, ptrimp, ptrloc);
	ADDFAC(_Tw2, cat, ptrimp, ptrloc);
	ADDFAC(_Tw3, cat, ptrimp, ptrloc);
	ADDFAC(_Tw4, cat, ptrimp, ptrloc);
	ADDFAC(_Tw5, cat, ptrimp, ptrloc);
	ADDFAC(_Tw6, cat, ptrimp, ptrloc);
	ADDFAC(_Tw7, cat, ptrimp, ptrloc);
	ADDFAC(_Tw9, cat, ptrimp, ptrloc);
	ADDFAC(_Tw11, cat, ptrimp, ptrloc);
	ADDFAC(_Tw12, cat, ptrimp, ptrloc);
	ADDFAC(_Tw13, cat, ptrimp, ptrloc);
	ADDFAC(_Tw14, cat, ptrimp, ptrloc);
	//...
	ADDFAC(_Twc1, cat, ptrimp, ptrloc);
	}
_STD_END
 #endif /* _IS_EMBEDDED */

/*
 * Copyright (c) 1992-2004 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V4.02:1476 */
