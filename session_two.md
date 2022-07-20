# 2022. 7. 20. Wed

Host:
  - 손동욱: dongook@bulkrum.kr
  - GitHub: `donny-son`

---

## Topics for this session

- 개발 로드맵
- Go 활용 및 실습
- Neo4j 소개
- Neovim & Markdown

---

## Development Roadmap

- [Backend](https://roadmap.sh/backend)
- [Frontend](https://roadmap.sh/frontend)

---

## Intro to Go

- [Go Landscape](https://roadmap.sh/golang)

---

### Working Example: Link Crawler

- [Colly](http://go-colly.org): Web crawling framework for Go
  - Fast, Easy, and Powerful

---

### Working Example: Link Crawler

```go
// source http://go-colly.org/docs/examples/scraper_server/
package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/gocolly/colly"
)

type pageInfo struct {
	StatusCode int
	Links      map[string]int
}

func handler(w http.ResponseWriter, r *http.Request) {
	URL := r.URL.Query().Get("url")
	if URL == "" {
		log.Println("missing URL argument")
		return
	}
	log.Println("visiting", URL)

	c := colly.NewCollector()

	p := &pageInfo{Links: make(map[string]int)}

	// count links
	c.OnHTML("a[href]", func(e *colly.HTMLElement) {
		link := e.Request.AbsoluteURL(e.Attr("href"))
		if link != "" {
			p.Links[link]++
		}
	})

	// extract status code
	c.OnResponse(func(r *colly.Response) {
		log.Println("response received", r.StatusCode)
		p.StatusCode = r.StatusCode
	})
	c.OnError(func(r *colly.Response, err error) {
		log.Println("error:", r.StatusCode, err)
		p.StatusCode = r.StatusCode
	})

	c.Visit(URL)

	// dump results
	b, err := json.Marshal(p)
	if err != nil {
		log.Println("failed to serialize response:", err)
		return
	}
	w.Header().Add("Content-Type", "application/json")
	w.Write(b)
}

func main() {
	addr := ":7171"

	http.HandleFunc("/", handler)

	log.Println("listening on", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
```

---

## Intro to Neo4j

- [Neo4j](https://neo4j.com): Graph Database
  - Node & Edge
  - Fast & Easy & Scalable JOINs compared to Relational DBs

---

## Cypher Query

- `.cql`

```cypher
CREATE (p:Person {name: '손동욱'});
CREATE (c:Company {name: 'Zarathu'});
CREATE (m:Meta {name: 'Startup'});

MATCH 
    (me: Person {name: '손동욱'}), 
    (za: Company {name: 'Zarathu'}),
    (startup:Meta {name: 'Startup'}),
CREATE 
    (za)-[:IS_A]->(startup),
    (me)-[:WORKED_FOR]->(za);
```

---

## Neovim & Markdown & Presentation

---

### Neovim

- [Neovim](https://neovim.io/): Modal Text Editor with Vim compatibility and lua scripting support.
- Why?
  - Fun to use.
  - Extensive customization.

--- 

### Markdown

- `.md` format for writing text.
- Supports various rendering modes(Presentation, Webpage, GitHub, ...).
