# PHP webszerver készítése

## Szökséges állományok
[PHP for windows](https://downloads.php.net/~windows/)
[Visual C++](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170#latest-supported-redistributable)

## PHP teszt oldal
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
