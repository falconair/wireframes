# Critique findings: Recipe Box (web app, desktop + phone)

App: a personal recipe manager. Screens: Home (recipe grid with search box), Recipe page
(title, photo, ingredients list, steps, Edit and Delete buttons top right), Settings.

1. Delete sits right next to Edit on the recipe page, same style, and deletes immediately
   with no confirmation and no undo. Two users lost recipes this week.
2. Search lives only on Home. On a Recipe page you must go Home to search again.
3. The ingredient filter on Home is a long list of 40 checkboxes in a sidebar that pushes
   the grid off screen at phone width. Not sure of the fix: chips row, a "Filter" sheet,
   or typing ingredients into the search box.
4. Users keep asking for a Shopping list: tick ingredients on a recipe and collect them on
   one list across recipes. Doesn't exist yet.
5. The recipe grid has no empty state (blank page for new users), no error state when the
   sync fails, and a spinner that covers everything while loading.
