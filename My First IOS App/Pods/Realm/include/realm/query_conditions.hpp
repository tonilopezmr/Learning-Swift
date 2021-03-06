/*************************************************************************
 *
 * REALM CONFIDENTIAL
 * __________________
 *
 *  [2011] - [2015] Realm Inc
 *  All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Realm Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Realm Incorporated
 * and its suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Realm Incorporated.
 *
 **************************************************************************/
#ifndef REALM_QUERY_CONDITIONS_HPP
#define REALM_QUERY_CONDITIONS_HPP

#include <stdint.h>
#include <string>

#include <realm/unicode.hpp>
#include <realm/binary_data.hpp>

namespace realm {

// Array::VTable only uses the first 4 conditions (enums) in an array of function pointers
enum {cond_Equal, cond_NotEqual, cond_Greater, cond_Less, cond_VTABLE_FINDER_COUNT, cond_None, cond_LeftNotNull };

// Quick hack to make "Queries with Integer null columns" able to compile in Visual Studio 2015 which doesn't full support sfinae
// (real cause hasn't been investigated yet, cannot exclude that we don't obey c++11 standard)
struct HackClass
{
    template<class A, class B, class C>
    bool can_match(A, B, C) { REALM_ASSERT(false); return false; }
    template<class A, class B, class C>
    bool will_match(A, B, C) { REALM_ASSERT(false); return false; }
};

// Does v2 contain v1?
struct Contains : public HackClass {
    bool operator()(StringData v1, const char*, const char*, StringData v2, bool = false, bool = false) const { return v2.contains(v1); }
    bool operator()(StringData v1, StringData v2, bool = false, bool = false) const { return v2.contains(v1); }
    bool operator()(BinaryData v1, BinaryData v2, bool = false, bool = false) const { return v2.contains(v1); }

    template<class A, class B>
    bool operator()(A, B) const { REALM_ASSERT(false); return false; }
    bool operator()(int64_t, int64_t, bool, bool) const { REALM_ASSERT(false); return false; }

    static const int condition = -1;
};

// Does v2 begin with v1?
struct BeginsWith : public HackClass {
    bool operator()(StringData v1, const char*, const char*, StringData v2, bool = false, bool = false) const { return v2.begins_with(v1); }
    bool operator()(StringData v1, StringData v2, bool = false, bool = false) const { return v2.begins_with(v1); }
    bool operator()(BinaryData v1, BinaryData v2, bool = false, bool = false) const { return v2.begins_with(v1); }

    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }
    template<class A, class B>
    bool operator()(A, B) const { REALM_ASSERT(false); return false; }

    static const int condition = -1;
};

// Does v2 end with v1?
struct EndsWith : public HackClass {
    bool operator()(StringData v1, const char*, const char*, StringData v2, bool = false, bool = false) const { return v2.ends_with(v1); }
    bool operator()(StringData v1, StringData v2, bool = false, bool = false) const { return v2.ends_with(v1); }
    bool operator()(BinaryData v1, BinaryData v2, bool = false, bool = false) const { return v2.ends_with(v1); }

    template<class A, class B>
    bool operator()(A, B) const { REALM_ASSERT(false); return false; }
    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }

    static const int condition = -1;
};

struct Equal {
    static const int avx = 0x00; // _CMP_EQ_OQ
//    bool operator()(const bool v1, const bool v2, bool v1null = false, bool v2null = false) const { return v1 == v2; }
    bool operator()(StringData v1, const char*, const char*, StringData v2, bool = false, bool = false) const 
    { 
        return v1 == v2; 
    }
    bool operator()(BinaryData v1, BinaryData v2, bool = false, bool = false) const { return v1 == v2; }

    template<class T>
    bool operator()(const T& v1, const T& v2, bool v1null = false, bool v2null = false) const 
    {
        return (v1null && v2null) || (!v1null && !v2null && v1 == v2);
    }
    static const int condition = cond_Equal;
    bool can_match(int64_t v, int64_t lbound, int64_t ubound) { return (v >= lbound && v <= ubound); }
    bool will_match(int64_t v, int64_t lbound, int64_t ubound) { return (v == 0 && ubound == 0 && lbound == 0); }
};

struct NotEqual {
    static const int avx = 0x0B; // _CMP_FALSE_OQ
    bool operator()(StringData v1, const char*, const char*, StringData v2, bool = false, bool = false) const { return v1 != v2; }
   // bool operator()(BinaryData v1, BinaryData v2, bool = false, bool = false) const { return v1 != v2; }

    template<class T>
    bool operator()(const T& v1, const T& v2, bool v1null = false, bool v2null = false) const 
    { 
        if (!v1null && !v2null) 
            return v1 != v2; 

        if (v1null && v2null)
            return false;

        return true;
    }
    
    static const int condition = cond_NotEqual;
    bool can_match(int64_t v, int64_t lbound, int64_t ubound) { return !(v == 0 && ubound == 0 && lbound == 0); }
    bool will_match(int64_t v, int64_t lbound, int64_t ubound) { return (v > ubound || v < lbound); }

    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }
};

// Does v2 contain v1?
struct ContainsIns : public HackClass {
    bool operator()(StringData v1, const char* v1_upper, const char* v1_lower, StringData v2, bool = false, bool = false) const
    {
        if (v2.is_null() && !v1.is_null())
            return false;

        if (v1.size() == 0 && !v2.is_null())
            return true;

        return search_case_fold(v2, v1_upper, v1_lower, v1.size()) != v2.size();
    }

    // Slow version, used if caller hasn't stored an upper and lower case version
    bool operator()(StringData v1, StringData v2, bool = false, bool = false) const
    {
        if (v2.is_null() && !v1.is_null())
            return false;

        if (v1.size() == 0 && !v2.is_null())
            return true;

        std::string v1_upper = case_map(v1, true, IgnoreErrors);
        std::string v1_lower = case_map(v1, false, IgnoreErrors);
        return search_case_fold(v2, v1_upper.c_str(), v1_lower.c_str(), v1.size()) != v2.size();
    }

    template<class A, class B>
    bool operator()(A, B) const { REALM_ASSERT(false); return false; }
    bool operator()(int64_t, int64_t, bool, bool) const { REALM_ASSERT(false); return false; }

    static const int condition = -1;
};

// Does v2 begin with v1?
struct BeginsWithIns : public HackClass {
    bool operator()(StringData v1, const char* v1_upper, const char* v1_lower, StringData v2, bool = false, bool = false) const
    {
        if (v2.is_null() && !v1.is_null())
            return false;
        return v1.size() <= v2.size() && equal_case_fold(v2.prefix(v1.size()), v1_upper, v1_lower);
    }

    // Slow version, used if caller hasn't stored an upper and lower case version
    bool operator()(StringData v1, StringData v2, bool = false, bool = false) const
    {
        if (v2.is_null() && !v1.is_null())
            return false;

        if (v1.size() > v2.size())
            return false;
        std::string v1_upper = case_map(v1, true, IgnoreErrors);
        std::string v1_lower = case_map(v1, false, IgnoreErrors);
        return equal_case_fold(v2.prefix(v1.size()), v1_upper.c_str(), v1_lower.c_str());
    }

    template<class A, class B>
    bool operator()(A, B) const { REALM_ASSERT(false); return false; }
    bool operator()(int64_t, int64_t, bool, bool) const { REALM_ASSERT(false); return false; }

    static const int condition = -1;
};

// Does v2 end with v1?
struct EndsWithIns : public HackClass {
    bool operator()(StringData v1, const char* v1_upper, const char* v1_lower, StringData v2, bool = false, bool = false) const
    {
        if (v2.is_null() && !v1.is_null())
            return false;

        return v1.size() <= v2.size() && equal_case_fold(v2.suffix(v1.size()), v1_upper, v1_lower);
    }

    // Slow version, used if caller hasn't stored an upper and lower case version
    bool operator()(StringData v1, StringData v2, bool = false, bool = false) const
    {
        if (v2.is_null() && !v1.is_null())
            return false;

        if (v1.size() > v2.size())
            return false;
        std::string v1_upper = case_map(v1, true, IgnoreErrors);
        std::string v1_lower = case_map(v1, false, IgnoreErrors);
        return equal_case_fold(v2.suffix(v1.size()), v1_upper.c_str(), v1_lower.c_str());
    }

    template<class A, class B>
    bool operator()(A, B) const { REALM_ASSERT(false); return false; }
    bool operator()(int64_t, int64_t, bool, bool) const { REALM_ASSERT(false); return false; }

    static const int condition = -1;
};

struct EqualIns : public HackClass {
    bool operator()(StringData v1, const char* v1_upper, const char* v1_lower, StringData v2, bool = false, bool = false) const
    {
        if (v1.is_null() != v2.is_null())
            return false;

        return v1.size() == v2.size() && equal_case_fold(v2, v1_upper, v1_lower);
    }

    // Slow version, used if caller hasn't stored an upper and lower case version
    bool operator()(StringData v1, StringData v2, bool = false, bool = false) const
    {
        if (v1.is_null() != v2.is_null())
            return false;

        if (v1.size() != v2.size())
            return false;
        std::string v1_upper = case_map(v1, true, IgnoreErrors);
        std::string v1_lower = case_map(v1, false, IgnoreErrors);
        return equal_case_fold(v2, v1_upper.c_str() , v1_lower.c_str());
    }

    template<class A, class B>
    bool operator()(A, B) const { REALM_ASSERT(false); return false; }
    bool operator()(int64_t, int64_t, bool, bool) const { REALM_ASSERT(false); return false; }

    static const int condition = -1;
};

struct NotEqualIns : public HackClass {
    bool operator()(StringData v1, const char* v1_upper, const char* v1_lower, StringData v2, bool = false, bool = false) const
    {
        if (v1.is_null() != v2.is_null())
            return true;
        return v1.size() != v2.size() || !equal_case_fold(v2, v1_upper, v1_lower);
    }

    // Slow version, used if caller hasn't stored an upper and lower case version
    bool operator()(StringData v1, StringData v2, bool = false, bool = false) const
    {
        if (v1.is_null() != v2.is_null())
            return true;

        if (v1.size() != v2.size())
            return true;        
        std::string v1_upper = case_map(v1, true, IgnoreErrors);
        std::string v1_lower = case_map(v1, false, IgnoreErrors);
        return !equal_case_fold(v2, v1_upper.c_str(), v1_lower.c_str());
    }

    template<class A, class B>
    bool operator()(A, B) const { REALM_ASSERT(false); return false; }
    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }

    static const int condition = -1;
};

struct Greater {
    static const int avx = 0x1E;  // _CMP_GT_OQ
    template<class T>
    bool operator()(const T& v1, const T& v2, bool v1null = false, bool v2null = false) const 
    {
        if (v1null || v2null)
            return false;

        return v1 > v2;
    }
    static const int condition = cond_Greater;
    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }

    bool can_match(int64_t v, int64_t lbound, int64_t ubound) { static_cast<void>(lbound); return ubound > v; }
    bool will_match(int64_t v, int64_t lbound, int64_t ubound) { static_cast<void>(ubound); return lbound > v; }
};

struct None {
    template<class T>
    bool operator()(const T&, const T&, bool = false, bool = false) const {return true;}
    static const int condition = cond_None;
    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }
    bool can_match(int64_t v, int64_t lbound, int64_t ubound) {static_cast<void>(lbound); static_cast<void>(ubound); static_cast<void>(v); return true; }
    bool will_match(int64_t v, int64_t lbound, int64_t ubound) {static_cast<void>(lbound); static_cast<void>(ubound); static_cast<void>(v); return true; }
};

struct NotNull {
    template<class T>
    bool operator()(const T&, const T&, bool v = false, bool = false) const { return !v; }
    static const int condition = cond_LeftNotNull;
    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }
    bool can_match(int64_t v, int64_t lbound, int64_t ubound) { static_cast<void>(lbound); static_cast<void>(ubound); static_cast<void>(v); return true; }
    bool will_match(int64_t v, int64_t lbound, int64_t ubound) { static_cast<void>(lbound); static_cast<void>(ubound); static_cast<void>(v); return true; }
};


struct Less {
    static const int avx = 0x11; // _CMP_LT_OQ
    template<class T>
    bool operator()(const T& v1, const T& v2, bool v1null = false, bool v2null = false) const {
        if (v1null || v2null)
            return false;

        return v1 < v2; 
    }
    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }
    static const int condition = cond_Less;
    bool can_match(int64_t v, int64_t lbound, int64_t ubound) { static_cast<void>(ubound); return lbound < v; }
    bool will_match(int64_t v, int64_t lbound, int64_t ubound) { static_cast<void>(lbound); return ubound < v; }
};

struct LessEqual : public HackClass {
    static const int avx = 0x12;  // _CMP_LE_OQ
    template<class T>
    bool operator()(const T& v1, const T& v2, bool v1null = false, bool v2null = false) const {
        if (v1null && v2null)
            return true;

        return (!v1null && !v2null && v1 <= v2);
    }
    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }
    static const int condition = -1;
};

struct GreaterEqual : public HackClass {
    static const int avx = 0x1D;  // _CMP_GE_OQ
    template<class T>
    bool operator()(const T& v1, const T& v2, bool v1null = false, bool v2null = false) const {
        if (v1null && v2null)
            return true;

        return (!v1null && !v2null && v1 >= v2);
    }
    template<class A, class B, class C, class D>
    bool operator()(A, B, C, D) const { REALM_ASSERT(false); return false; }
    static const int condition = -1;
};


// CompareLess is a temporary hack to have a generalized way to compare any realm types. Todo, enable correct < 
// operator of StringData (currently gives circular header dependency with utf8.hpp)
template<class T>
struct CompareLess
{
    static bool compare(T v1, T v2, bool = false, bool = false)
    {
        return v1 < v2;
    }
};
template<>
struct CompareLess<StringData>
{
    static bool compare(StringData v1, StringData v2, bool = false, bool = false)
    {
        bool ret = utf8_compare(v1.data(), v2.data());
        return ret;
    }
};

} // namespace realm

#endif // REALM_QUERY_CONDITIONS_HPP
