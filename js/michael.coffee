---
#CoffeeScript
---

{% include_relative /michael2.js %}

fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."

alert fill("cup")

