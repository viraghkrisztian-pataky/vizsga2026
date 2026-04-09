# PHP webszerver készítése
Az php tesztekéséhez észíteni kell egy 
> phpinfo.php
oldalt, amelynek tartalma
```

<?php

// Show all information, defaults to INFO_ALL
phpinfo();

// Show just the module information.
// phpinfo(8) yields identical results.
phpinfo(INFO_MODULES);

?>
```
