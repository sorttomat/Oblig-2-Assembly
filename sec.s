    .globl hms_to_sec 

hms_to_sec:
;Denne funksjonen tar inn tre parametre, ett som viser timen, ett som viser minuttet, og ett som viser sekundet (etter midnatt).

            imulq $3600, %rdi
            ;timen multipliseres med antall sekunder/time (3600).
            imulq $60, %rsi
            ;minuttet multipliseres med antall sekunder/minutt (60).
            movq %rdx, %rax
            addq %rdi, %rax
            addq %rsi, %rax
            ;sekundet adderes med resultatene av de to siste operasjonene.            
            ret

    .globl sec_to_h

sec_to_h:
;Denne funksjonen tar inn antall sekunder siden midnatt, og returnerer timen.

            movq %rdi, %rax
            ;flytter antall sekunder til rax for aa kunne dividere.
            movq $3600, %r8
            cqo
            idiv %r8
            ;dividerer antall sekunder paa antall sekunder/time (3600)
            ret

    .globl sec_to_m

sec_to_m: 
;Denne funksjonen tar inn antall sekunder, og returnerer minuttet.

            movq %rdi, %rax 
            ;flytter antall sekunder til rax
            movq $60, %r8
            ;flytter tallet 60 (antall sekunder/minutt) til r8.
            cqo
            idiv %r8
            ;deler antall sekunder paa 60. Resultatet havner i rax.
            cqo
            idiv %r8
            ;deler resultatet paa 60 (antall minutter/time).
            movq %rdx, %rax
            ;modulus havner i rdx, og det er dette tallet jeg er interessert i.
            ;jeg flytter modulus til rax
            ret
            

    .globl sec_to_s

sec_to_s:
;Denne funksjonen tar inn antall sekunder, og returnerer sekundet.
            
            movq %rdi, %rax
            movq $60, %r8
            cqo
            idiv %r8
            ;deler sekunder paa antall sekunder/minutt (60).
            movq %rdx, %rax
            ;flytter modulus fra divisjonen til rax.
            ret
