# Users who can ssh (as admin@) to the Jenkins build machines.
let
  keys = {
    srid = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYQ003p7fB5ICQehLwhDBomY9WzkNBeijkSw9ADGU+ECrPakeIH3pntUWRJH1W93vKnLqpkn6HLGEXD9MCR0s98uhh8hT7uAYCxQTbEeKT3PYkfz3oe7XaR8rE601sds0ZyFwH7l8cvK97pGr+uhFXAaohiV6VqmLVXhManEjZZ8GfYWBD9BCmIJk43G3OGa5QYFeHqztprXaJNU5dFPv2Uq2C+L6EvfCfkK2OO1BLZgL+Rai5jjyy6k0fcfsxxd9BdGUwqDhcBeyTIzX9rePMugf/xD+6uNRxTU+vjVpGUtFOw6rpgmVyFv9mn3QMNdQBc5hYKVbIQwMNGTzGgcQv";
    shivaraj = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrKY9Z1oDz5zNOJxcOBnb9cIzlVdEMmhglT7RfCSrY041FqSxQwqJmeQJ1vSsK4MAQq03X4JTmeaxvtf3p/EwhEMh7a4PK4V+lzxydfsvqNuSiHC9Jg5HUQymgABYiOVv352EO6E9vmGdJIVrGB4TFxNbMh3kG9KCqszDlXMA9/fHCTJejvJOJ26f4qpXazQFqts/5wT2z2J75GvY5ngKeQzFd4x2rHmOWd1DH/nOq4drZNkzfOgvEBYSLha8WL4Sc8mNpAG5/7zDdqjA5i4b/M2zQzjE/kgglfk2y3CPAKMJC82gbv8mQy/Y9F4RNyn71Kx3iUWJVF22pOAb+aNYxFw9qRlCracVJxhXxRxRj9c092m6jbwUmC63RYCDrlen3dd9+AYxYBL1LjnzBT2xFdREHp6Wch2Y5JiXDtMV4x/hlH2saxkZNnfRcvNdG8GJrCmxOBgruBMspPCGEEzPZRlD/BAb25z2DVjMBIwZs7yIJTvocrTHzDa9dRmwJIqE= shivaraj@shivaraj.bh-MacBookPro";
    hemanth = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqBXOWcjuosGOUm0AcnVrmDuFhRLoZwdDkISs5gt1gwMjd66wca4C8zySg3qSSXyz49/RNXfqnGCTajLuLQbWPkksH+hg8LWTGSMvLQ1p8wmg7bj8xQ0OIzAYDaPYLfz3G6tFOCvXAmOaPJOaK5lV63WaqBHc09aVx7Nff/pChE7TO1J00WnUACMUMNRXPFJntGxPlXXwlNEjE+tVzQ7faBgYVjoT631wAMZqOWiofKC6G+aYA+TqY6qlVSST39qFRKlou6sCx5Q5cqZ/MpNPvigZxzVKpQkve4Ir+WFzkJhmpsizQ9ty7hWzZ0TANXb0P1HTJRSWSemqGxw6jnwehCR9xtWNMgZkAuC7FSA/+Ou1HeHNEhX97lEHCdc8nMrKAWD4KXSoeLn3j8uuwm3U9r//p0JqVnjwgYQWhR37oYwRv1lEKoQOH0SI16+MrDqTNgqS/HPrsRBIJq5rqJjjy7JUkeBOWveHKqiTPxoL1sp7RITmaOD+4kx9PJr1eIzE= hemantmangla@hemantmangla-MacBookPro";
  };
in
[ keys.shivaraj keys.srid keys.hemanth ]