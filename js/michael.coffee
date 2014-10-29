---
#CoffeeScript
---

{% include_relative michael2.coffee %}

fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."

alert fill("cup")

