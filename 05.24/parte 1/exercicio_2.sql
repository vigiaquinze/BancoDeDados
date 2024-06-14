CREATE TABLE reserva (
id_reserva serial PRIMARY KEY,
id_cliente int,
data_reserva varchar(50),
id_carro int,
numero_agencia int
);

ALTER TABLE IF EXISTS public.reserva
    ADD CONSTRAINT reserva_id_cliente_fkey FOREIGN KEY (id_cliente)
    REFERENCES public.clientes (id_cliente) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS fki_reserva_id_cliente_fkey
    ON public.reserva(id_cliente);
	

ALTER TABLE IF EXISTS public.reserva
    ADD CONSTRAINT reserva_id_carro_fkey FOREIGN KEY (id_carro)
    REFERENCES public.carro (id_carro) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS fki_reserva_id_carro_fkey
    ON public.reserva(id_carro);
	
ALTER TABLE IF EXISTS public.reserva
    ADD CONSTRAINT reserva_numero_agencia_fkey FOREIGN KEY (numero_agencia)
    REFERENCES public.agencia (numero_agencia) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS fki_reserva_numero_agencia_fkey
    ON public.reserva(numero_agencia);