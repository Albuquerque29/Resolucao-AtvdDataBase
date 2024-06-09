-- POSSIVÉIS CONSULTAS DE EXEMPLO PARA USAR NESTE BANCO

--  Total de Vendas po Mês
SELECT 
    DATE_FORMAT(D.DiaData, '%Y-%m') AS Mes,
    SUM(FP.ValorTotalPedido) AS TotalVendas
FROM 
    Fato_Pedidos FP
INNER JOIN 
    Dim_Data D ON FP.FkIdData = D.IdData
GROUP BY 
    Mes;

--Quantidade de Pedidos Por Clientes
SELECT 
    DC.NomeCliente,
    COUNT(*) AS QuantidadePedidos
FROM 
    Fato_Pedidos FP
INNER JOIN 
    Dim_Cliente DC ON FP.FkIdCliente = DC.IdCliente
GROUP BY 
    DC.NomeCliente;

--Total de Vendas Por Promoção
SELECT 
    DP.Descricao,
    SUM(FP.ValorTotalPedido) AS TotalVendas
FROM 
    Fato_Pedidos FP
INNER JOIN 
    Dim_Promocao DP ON FP.FkIdPromocao = DP.IdPromocao
GROUP BY 
    DP.Descricao;

--Total de Vendas por Garçom De Forma Decrescente
SELECT 
    DG.NomeGarcom,
    SUM(FP.ValorTotalPedido) AS TotalVendas
FROM 
    Fato_Pedidos FP
INNER JOIN 
    Dim_Garcom DG ON FP.FkIdGarcom = DG.IdGarcom
GROUP BY 
    DG.NomeGarcom
ORDER BY 
    TotalVendas DESC;