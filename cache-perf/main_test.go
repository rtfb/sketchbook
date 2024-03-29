package main

import "testing"

var users []User

func init() {
	const size = 10_000

	countries := []string{
		"AD",
		"BB",
		"CA",
		"DK",
	}

	users = make([]User, size)
	for i := 0; i < size; i++ {
		users[i].Active = i%5 > 0 // 20% non active
		users[i].Country = countries[i%len(countries)]
		users[i].Icon = make([]byte, 128*128)
	}
}

func BenchmarkCountryCount(b *testing.B) {
	for i := 0; i < b.N; i++ {
		m := CountryCount(users)
		if m == nil {
			b.Fatal(m)
		}
	}
}
