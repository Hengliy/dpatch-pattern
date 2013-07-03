/// add .owner to struct snd_soc_card
///
/// Add missing .owner of struct snd_soc_card. This prevents the
/// module from being removed from underneath its users.
///
@r1@
identifier nm;
position p;
@@
struct snd_soc_card nm@p = {
...,
.owner = THIS_MODULE,
...
};

@@
expression e;
identifier nm;
position p != {r1.p};
@@
struct snd_soc_card nm@p = {
...,
  .name = e,
+ .owner = THIS_MODULE,
...
};

