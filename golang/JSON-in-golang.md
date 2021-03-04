---
title: 'JSON in Golang'
---

# Encode

Structs can have meta which is used when encoding/decoding JSON
```go
type Athlete struct {
	Bio           string `json:"bio"`
	City          string `json:"city"`
	Country       string `json:"country"`
	Created_at    string `json:"created_at"`
}
```
`json:` is simply the convention. Only *exported* (Capitalized) fields are encoded.

Encoding
```go
athlete := Athlete{
	Bio:           "Really cool dude",
	City:          "Somewhere",
	Country:       "Very far",
	Created_at:    "Some time ago",
}

json, _ := json.Marshal(athlete)

fmt.Println(string(json))
```

# Decode
```go
var athlete Athlete

err := json.Unmarshal(json, &athlete)

fmt.Println(json)
```

## Decode http response body

```go
var athlete Athlete
err = json.NewDecoder(resp.Body).Decode(&athlete)
```

Check your err and use your `athlete` variable.

## There and back again

```go
type Athlete struct {
	Bio           string `json:"bio"`
	City          string `json:"city"`
	Country       string `json:"country"`
	Created_at    string `json:"created_at"`
}

func main() {
	a1 := Athlete{
		Bio:           "Really cool dude",
		City:          "Somewhere",
		Country:       "Very far",
		Created_at:    "Some time ago",
	}

	var a2 Athlete

	j, _ := json.Marshal(a1)

	fmt.Println("encoding")
	fmt.Println(string(j))

	fmt.Println("decoding back")
	_ = json.Unmarshal(j, &a2)

	fmt.Println(a2)

	fmt.Println("and to json again")
	j2, _ := json.Marshal(a2)
	fmt.Println(string(j2))

	fmt.Println("done with this bullshit")
}
```
