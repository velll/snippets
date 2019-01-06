Change file extensions in directory — all `*.rb` files to `*.md`
```bash
for file in *.rb
do
  mv "$file" "${file%.rb}.md"
done
```
