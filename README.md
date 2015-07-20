# AspEmail.net cookbook

Chef cookbook to setup Persits AspEmail.Net on a server.

Set's up version 5.4.0.4422 via embedded files as the developer website always has the latest version only.

## Supported Platforms

Tested on:

* Windows 2012 R2

## Attributes

| Atribute | Default | Description |
| --- |:----:|:-----------:|:-------:|
| ['aspemail_net']['install_path'] | C:\Program Files (x86)\Persits Software\AspEmail.NET\EmailAgent.NET | Location where to install AspEmail.net |
| ['aspemail_net']['service_name'] | Persits Software EmailAgent.NET | Name for the windows service |

## Usage

### aspemail_net_cookbook::default

Include `aspemail_net_cookbook` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[aspemail_net_cookbook::default]"
  ]
}
```

## License and Authors

Author: Nuno Pereira (<nvnivs@gmail.com>)
