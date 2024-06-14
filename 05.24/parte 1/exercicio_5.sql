CREATE TABLE seguro_carro (
id_carro int,
tipo_seguro varchar(20),
seguradora varchar(50),
cobertura varchar(100),
valor_mensal_seguro money,
data_inicio varchar(50),
data_termino varchar(50)
);

ALTER TABLE IF EXISTS public.seguro_carro
    ADD CONSTRAINT seguro_id_carro FOREIGN KEY (id_carro)
    REFERENCES public.carro (id_carro) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS fki_seguro_id_carro
    ON public.seguro_carro(id_carro);
	
