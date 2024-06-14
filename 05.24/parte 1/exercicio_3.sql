CREATE TABLE devolucao (
id_devolucao serial PRIMARY KEY,
data_devolucao varchar(50),
id_cliente int,
id_carro int,
numero_agencia int,
custos_adicionais money,
id_pagamento int
);

ALTER TABLE IF EXISTS public.devolucao
    ADD CONSTRAINT devolucao_id_cliente_fkey FOREIGN KEY (id_cliente)
    REFERENCES public.clientes (id_cliente) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS fki_devolucao_id_cliente_fkey
    ON public.devolucao(id_cliente);
	
ALTER TABLE IF EXISTS public.devolucao
    ADD CONSTRAINT devolucao_id_carro_fkey FOREIGN KEY (id_carro)
    REFERENCES public.carros (id_carro) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS fki_devolucao_id_carro_fkey
    ON public.devolucao(id_carro);
	
ALTER TABLE IF EXISTS public.devolucao
    ADD CONSTRAINT devolucao_numero_agencia_fkey FOREIGN KEY (numero_agencia)
    REFERENCES public.agencia (numero_agencia) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS fki_devolucao_numero_agencia_fkey
    ON public.devolucao(numero_agencia);
	
ALTER TABLE IF EXISTS public.devolucao
    ADD CONSTRAINT devolucao_id_comprovante_fkey FOREIGN KEY (id_comprovante)
    REFERENCES public.pagamento (id_comprovante) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS fki_pagamento_id_comprovante_fkey
    ON public.devolucao(id_comprovante);