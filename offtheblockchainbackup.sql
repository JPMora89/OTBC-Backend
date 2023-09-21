--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coins; Type: TABLE; Schema: public; Owner: jpmora
--

CREATE TABLE public.coins (
    id integer NOT NULL,
    coin_id character varying(50) NOT NULL,
    name character varying(500) NOT NULL,
    symbol character varying(50) NOT NULL,
    price double precision NOT NULL,
    image character varying(500),
    market_cap double precision NOT NULL,
    price_change_percentage_24h double precision,
    last_updated timestamp with time zone DEFAULT now()
);


ALTER TABLE public.coins OWNER TO jpmora;

--
-- Name: coins_id_seq; Type: SEQUENCE; Schema: public; Owner: jpmora
--

CREATE SEQUENCE public.coins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coins_id_seq OWNER TO jpmora;

--
-- Name: coins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jpmora
--

ALTER SEQUENCE public.coins_id_seq OWNED BY public.coins.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jpmora
--

CREATE TABLE public.users (
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO jpmora;

--
-- Name: watchlist_items; Type: TABLE; Schema: public; Owner: jpmora
--

CREATE TABLE public.watchlist_items (
    watchlist_item_id integer NOT NULL,
    watchlist_id integer,
    coin_id integer NOT NULL
);


ALTER TABLE public.watchlist_items OWNER TO jpmora;

--
-- Name: watchlist_items_watchlist_item_id_seq; Type: SEQUENCE; Schema: public; Owner: jpmora
--

CREATE SEQUENCE public.watchlist_items_watchlist_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watchlist_items_watchlist_item_id_seq OWNER TO jpmora;

--
-- Name: watchlist_items_watchlist_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jpmora
--

ALTER SEQUENCE public.watchlist_items_watchlist_item_id_seq OWNED BY public.watchlist_items.watchlist_item_id;


--
-- Name: watchlists; Type: TABLE; Schema: public; Owner: jpmora
--

CREATE TABLE public.watchlists (
    watchlist_id integer NOT NULL,
    username character varying(50),
    name character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.watchlists OWNER TO jpmora;

--
-- Name: watchlists_watchlist_id_seq; Type: SEQUENCE; Schema: public; Owner: jpmora
--

CREATE SEQUENCE public.watchlists_watchlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watchlists_watchlist_id_seq OWNER TO jpmora;

--
-- Name: watchlists_watchlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jpmora
--

ALTER SEQUENCE public.watchlists_watchlist_id_seq OWNED BY public.watchlists.watchlist_id;


--
-- Name: coins id; Type: DEFAULT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.coins ALTER COLUMN id SET DEFAULT nextval('public.coins_id_seq'::regclass);


--
-- Name: watchlist_items watchlist_item_id; Type: DEFAULT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.watchlist_items ALTER COLUMN watchlist_item_id SET DEFAULT nextval('public.watchlist_items_watchlist_item_id_seq'::regclass);


--
-- Name: watchlists watchlist_id; Type: DEFAULT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.watchlists ALTER COLUMN watchlist_id SET DEFAULT nextval('public.watchlists_watchlist_id_seq'::regclass);


--
-- Data for Name: coins; Type: TABLE DATA; Schema: public; Owner: jpmora
--

COPY public.coins (id, coin_id, name, symbol, price, image, market_cap, price_change_percentage_24h, last_updated) FROM stdin;
1	bitcoin	Bitcoin	btc	25848	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	503514551872	0.31929	2023-09-09 14:34:58.278806-04
2	ethereum	Ethereum	eth	1632.59	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	196294796647	0.36792	2023-09-09 14:34:58.281829-04
3	tether	Tether	usdt	0.999684	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	82989971556	0.02759	2023-09-09 14:34:58.28407-04
4	binancecoin	BNB	bnb	214.63	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	33020448445	0.44905	2023-09-09 14:34:58.285774-04
5	ripple	XRP	xrp	0.50284	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	26694038661	0.03294	2023-09-09 14:34:58.287253-04
6	usd-coin	USD Coin	usdc	0.999933	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26125341359	-0.0135	2023-09-09 14:34:58.289043-04
7	staked-ether	Lido Staked Ether	steth	1632.39	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	14034079415	0.47822	2023-09-09 14:34:58.290271-04
8	dogecoin	Dogecoin	doge	0.063399	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8937376144	0.84314	2023-09-09 14:34:58.291389-04
9	cardano	Cardano	ada	0.253315	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8879378132	0.02196	2023-09-09 14:34:58.292403-04
10	solana	Solana	sol	19.39	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7964775281	-0.20592	2023-09-09 14:34:58.293694-04
11	tron	TRON	trx	0.07899	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7050426917	0.38634	2023-09-09 14:34:58.295618-04
12	the-open-network	Toncoin	ton	1.78	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6140359254	-1.80308	2023-09-09 14:34:58.297901-04
13	polkadot	Polkadot	dot	4.24	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5398836958	0.12262	2023-09-09 14:34:58.30044-04
14	matic-network	Polygon	matic	0.540334	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	5036608282	-0.20456	2023-09-09 14:34:58.302301-04
15	litecoin	Litecoin	ltc	63	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4639267439	0.93321	2023-09-09 14:34:58.304202-04
16	shiba-inu	Shiba Inu	shib	7.57e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4464706847	0.84208	2023-09-09 14:34:58.30576-04
17	wrapped-bitcoin	Wrapped Bitcoin	wbtc	25882	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4214624663	0.38567	2023-09-09 14:34:58.307436-04
18	dai	Dai	dai	0.999871	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3829698653	0.08982	2023-09-09 14:34:58.30903-04
19	bitcoin-cash	Bitcoin Cash	bch	193.04	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3765282133	0.73671	2023-09-09 14:34:58.310687-04
20	stellar	Stellar	xlm	0.130673	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3594126611	4.7354	2023-09-09 14:34:58.312274-04
21	leo-token	LEO Token	leo	3.83	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3564261766	0.52393	2023-09-09 14:34:58.313935-04
22	avalanche-2	Avalanche	avax	9.86	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3490204657	-0.09781	2023-09-09 14:34:58.315767-04
23	chainlink	Chainlink	link	6.16	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3315822586	-0.74077	2023-09-09 14:34:58.317517-04
24	uniswap	Uniswap	uni	4.34	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3267274047	-0.84723	2023-09-09 14:34:58.319328-04
25	true-usd	TrueUSD	tusd	0.998512	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3183552961	0.02014	2023-09-09 14:34:58.321025-04
26	binance-usd	Binance USD	busd	0.999767	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2590230230	-0.05486	2023-09-09 14:34:58.32283-04
27	monero	Monero	xmr	142.31	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2583051118	-0.45243	2023-09-09 14:34:58.32465-04
28	okb	OKB	okb	42.16	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2528960913	0.26271	2023-09-09 14:34:58.326162-04
29	ethereum-classic	Ethereum Classic	etc	15.39	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2199670251	0.76151	2023-09-09 14:34:58.327926-04
30	cosmos	Cosmos Hub	atom	6.82	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1997636389	0.24267	2023-09-09 14:34:58.329651-04
31	hedera-hashgraph	Hedera	hbar	0.04916433	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1633283245	-0.553	2023-09-09 14:34:58.331134-04
32	internet-computer	Internet Computer	icp	3.27	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1450464288	-0.36472	2023-09-09 14:34:58.332299-04
33	filecoin	Filecoin	fil	3.23	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1444070202	0.75255	2023-09-09 14:34:58.334324-04
34	quant-network	Quant	qnt	98.61	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1435331739	-0.19362	2023-09-09 14:34:58.335746-04
35	crypto-com-chain	Cronos	cro	0.051857	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1361924461	-1.16138	2023-09-09 14:34:58.336834-04
36	lido-dao	Lido DAO	ldo	1.53	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1357804517	-1.20677	2023-09-09 14:34:58.337796-04
37	mantle	Mantle	mnt	0.411529	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1331078389	-0.75981	2023-09-09 14:34:58.339071-04
38	aptos	Aptos	apt	5.48	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1259930487	-0.31824	2023-09-09 14:34:58.340111-04
39	arbitrum	Arbitrum	arb	0.898215	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1145787311	0.116	2023-09-09 14:34:58.34138-04
40	vechain	VeChain	vet	0.01551697	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1128310423	-0.04315	2023-09-09 14:34:58.342536-04
41	near	NEAR Protocol	near	1.18	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1106736410	3.30791	2023-09-09 14:34:58.343808-04
42	optimism	Optimism	op	1.29	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1028702159	-0.88978	2023-09-09 14:34:58.345088-04
43	maker	Maker	mkr	1122.31	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1010477664	-1.07285	2023-09-09 14:34:58.34618-04
44	rocket-pool-eth	Rocket Pool ETH	reth	1768.91	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	928818463	0.40767	2023-09-09 14:34:58.347871-04
45	aave	Aave	aave	55.98	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	813429877	0.00708	2023-09-09 14:34:58.349621-04
46	the-graph	The Graph	grt	0.08675	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	797041310	0.77069	2023-09-09 14:34:58.351277-04
47	kaspa	Kaspa	kas	0.03848082	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	791390309	0.47064	2023-09-09 14:34:58.352903-04
48	xdce-crowd-sale	XDC Network	xdc	0.056013	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	776657635	-1.31947	2023-09-09 14:34:58.354186-04
49	whitebit	WhiteBIT Coin	wbt	5.29	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	762115569	-0.08659	2023-09-09 14:34:58.355274-04
50	algorand	Algorand	algo	0.094762	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	741671491	-0.57498	2023-09-09 14:34:58.35635-04
51	usdd	USDD	usdd	0.997133	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	723279870	0.07541	2023-09-09 14:34:58.357392-04
52	havven	Synthetix Network	snx	2.17	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	701611305	-0.95789	2023-09-09 14:34:58.358677-04
53	frax	Frax	frax	0.997203	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669849084	0.2682	2023-09-09 14:34:58.360175-04
54	blockstack	Stacks	stx	0.465467	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	654518961	1.61828	2023-09-09 14:34:58.361496-04
55	tezos	Tezos	xtz	0.690871	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	652189011	0.19901	2023-09-09 14:34:58.362893-04
56	eos	EOS	eos	0.581241	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	650835048	0.71016	2023-09-09 14:34:58.36421-04
57	elrond-erd-2	MultiversX	egld	24.56	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	637023859	0.81886	2023-09-09 14:34:58.36555-04
58	theta-token	Theta Network	theta	0.630453	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	630442367	0.16908	2023-09-09 14:34:58.366869-04
59	radix	Radix	xrd	0.061296	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	627315471	8.60076	2023-09-09 14:34:58.368317-04
60	the-sandbox	The Sandbox	sand	0.303125	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	626257951	0.45246	2023-09-09 14:34:58.369994-04
61	immutable-x	ImmutableX	imx	0.533618	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	621941099	-1.59612	2023-09-09 14:34:58.37104-04
62	bitget-token	Bitget Token	bgb	0.439919	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	616016142	0.81969	2023-09-09 14:34:58.372031-04
63	axie-infinity	Axie Infinity	axs	4.54	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	595266750	1.02235	2023-09-09 14:34:58.373001-04
64	bitcoin-cash-sv	Bitcoin SV	bsv	30.75	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	592688511	0.53727	2023-09-09 14:34:58.374348-04
65	fantom	Fantom	ftm	0.199948	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	560656202	-0.18666	2023-09-09 14:34:58.375918-04
66	injective-protocol	Injective	inj	6.65	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	555054206	-0.95145	2023-09-09 14:34:58.377171-04
67	render-token	Render	rndr	1.47	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	545404668	1.80648	2023-09-09 14:34:58.378455-04
68	decentraland	Decentraland	mana	0.294277	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	542541167	1.07918	2023-09-09 14:34:58.379827-04
69	gatechain-token	Gate	gt	3.88	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	533345366	0.21815	2023-09-09 14:34:58.38122-04
70	paxos-standard	Pax Dollar	usdp	1	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	520383809	0.28177	2023-09-09 14:34:58.382465-04
71	neo	NEO	neo	7.24	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	510973367	-0.87988	2023-09-09 14:34:58.383815-04
72	kava	Kava	kava	0.668711	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	504343236	0.78488	2023-09-09 14:34:58.385426-04
73	rollbit-coin	Rollbit Coin	rlb	0.149942	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	494393086	-1.19762	2023-09-09 14:34:58.38727-04
74	iota	IOTA	miota	0.176715	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	491420621	0.87619	2023-09-09 14:34:58.389049-04
75	apecoin	ApeCoin	ape	1.32	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	487447714	-0.05231	2023-09-09 14:34:58.390857-04
76	tether-gold	Tether Gold	xaut	1918.16	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	472882367	-0.10144	2023-09-09 14:34:58.39219-04
77	pax-gold	PAX Gold	paxg	1896.53	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	472453286	-0.2062	2023-09-09 14:34:58.393479-04
78	compound-ether	cETH	ceth	32.82	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	470304520	0.26649	2023-09-09 14:34:58.394788-04
79	thorchain	THORChain	rune	1.54	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	461837065	-2.10334	2023-09-09 14:34:58.396103-04
80	rocket-pool	Rocket Pool	rpl	23.39	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	460615011	0.69338	2023-09-09 14:34:58.397666-04
81	ecash	eCash	xec	2.342e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	459172282	1.27917	2023-09-09 14:34:58.398922-04
82	flow	Flow	flow	0.432095	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	447717790	0.32378	2023-09-09 14:34:58.400222-04
83	klay-token	Klaytn	klay	0.133034	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	423992109	1.3377	2023-09-09 14:34:58.401425-04
84	frax-ether	Frax Ether	frxeth	1630.28	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	421623677	0.41084	2023-09-09 14:34:58.40263-04
85	tokenize-xchange	Tokenize Xchange	tkx	5.19	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	415337570	1.95218	2023-09-09 14:34:58.403971-04
86	gala	GALA	gala	0.01591252	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	414297348	0.72711	2023-09-09 14:34:58.405808-04
87	chiliz	Chiliz	chz	0.058992	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	411533462	0.07276	2023-09-09 14:34:58.407352-04
88	kucoin-shares	KuCoin	kcs	4.17	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	404467877	4.10087	2023-09-09 14:34:58.408647-04
89	frax-share	Frax Share	fxs	5.44	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	400384484	0.59952	2023-09-09 14:34:58.409851-04
90	first-digital-usd	First Digital USD	fdusd	0.9987	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393459830	0.02025	2023-09-09 14:34:58.411035-04
91	huobi-token	Huobi	ht	2.44	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	389475642	0.79257	2023-09-09 14:34:58.412184-04
92	curve-dao-token	Curve DAO	crv	0.44279	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	384033446	0.49836	2023-09-09 14:34:58.413455-04
93	casper-network	Casper Network	cspr	0.03392916	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	383569705	-0.35655	2023-09-09 14:34:58.414966-04
94	bittorrent	BitTorrent	btt	4.01036e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	381328685	-0.05208	2023-09-09 14:34:58.416244-04
95	sui	Sui	sui	0.478309	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	378739633	-0.27496	2023-09-09 14:34:58.417465-04
96	mina-protocol	Mina Protocol	mina	0.38285	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	369530604	2.0918	2023-09-09 14:34:58.418685-04
97	terra-luna	Terra Luna Classic	lunc	6.082e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	353402200	0.73934	2023-09-09 14:34:58.420038-04
98	dydx	dYdX	dydx	1.97	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	345086067	-0.21511	2023-09-09 14:34:58.42153-04
99	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1710.85	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	339866866	0.3449	2023-09-09 14:34:58.422934-04
100	pepe	Pepe	pepe	7.85441e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	331371504	0.17476	2023-09-09 14:34:58.42454-04
101	trust-wallet-token	Trust Wallet	twt	0.790244	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	329393632	0.014	2023-09-09 14:34:58.426004-04
102	nexo	NEXO	nexo	0.579353	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	322853458	-0.7443	2023-09-09 14:34:58.42744-04
103	nxm	Nexus Mutual	nxm	46.79	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	316284204	0.36351	2023-09-09 14:34:58.428731-04
104	astar	Astar	astr	0.059251	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	311137747	-1.32061	2023-09-09 14:34:58.430098-04
105	apenft	APENFT	nft	3.137e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	310545729	0.45726	2023-09-09 14:34:58.431581-04
106	gemini-dollar	Gemini Dollar	gusd	0.999921	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307434562	0.34485	2023-09-09 14:34:58.433099-04
107	dash	Dash	dash	26.41	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	302210503	1.56471	2023-09-09 14:34:58.434798-04
108	gmx	GMX	gmx	32.99	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	297157138	-0.98882	2023-09-09 14:34:58.436423-04
109	staked-frax-ether	Staked Frax Ether	sfrxeth	1722.37	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	296511756	0.37987	2023-09-09 14:34:58.43765-04
110	flare-networks	Flare	flr	0.01258856	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	289045819	-0.6552	2023-09-09 14:34:58.43892-04
111	liquity-usd	Liquity USD	lusd	0.995787	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	286552902	0.00449	2023-09-09 14:34:58.440313-04
112	woo-network	WOO Network	woo	0.160783	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	281444101	-0.04144	2023-09-09 14:34:58.441683-04
113	arweave	Arweave	ar	4.26	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	279100298	2.02447	2023-09-09 14:34:58.443317-04
114	zilliqa	Zilliqa	zil	0.016358	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	277783887	-0.68241	2023-09-09 14:34:58.444586-04
115	pancakeswap-token	PancakeSwap	cake	1.24	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	275385015	0.55284	2023-09-09 14:34:58.445786-04
116	defichain	DeFiChain	dfi	0.362259	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	269997230	0.26321	2023-09-09 14:34:58.447189-04
117	compound-governance-token	Compound	comp	39.29	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	269674711	-0.13838	2023-09-09 14:34:58.448411-04
118	conflux-token	Conflux	cfx	0.126906	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	265889771	0.79338	2023-09-09 14:34:58.449693-04
119	compound-usd-coin	cUSDC	cusdc	0.02303408	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	265176006	-0.01238	2023-09-09 14:34:58.451044-04
120	gnosis	Gnosis	gno	100.93	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	261195070	0.19943	2023-09-09 14:34:58.452302-04
121	1inch	1inch	1inch	0.246072	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	253605545	0.81524	2023-09-09 14:34:58.453662-04
122	basic-attention-token	Basic Attention	bat	0.169866	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	253126459	0.77569	2023-09-09 14:34:58.454843-04
123	ecomi	ECOMI	omi	0.00092588	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	250918116	-0.12714	2023-09-09 14:34:58.456149-04
124	enjincoin	Enjin Coin	enj	0.249595	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	249425886	-0.39166	2023-09-09 14:34:58.457377-04
125	mx-token	MX	mx	2.45	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	246536066	-0.62321	2023-09-09 14:34:58.458739-04
126	fetch-ai	Fetch.ai	fet	0.234357	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	244794760	-2.09109	2023-09-09 14:34:58.460031-04
127	tominet	tomiNet	tomi	3.25	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	242661083	-3.17122	2023-09-09 14:34:58.461406-04
128	safepal	SafePal	sfp	0.575049	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	241963297	-4.50116	2023-09-09 14:34:58.462714-04
129	oec-token	OKT Chain	okt	13.44	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	239959282	-0.0422	2023-09-09 14:34:58.464021-04
130	illuvium	Illuvium	ilv	41.13	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	239514465	0.18811	2023-09-09 14:34:58.465189-04
131	chia	Chia	xch	28.18	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	237120351	0.45791	2023-09-09 14:34:58.466535-04
132	loopring	Loopring	lrc	0.188517	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	235000986	1.99576	2023-09-09 14:34:58.467566-04
133	singularitynet	SingularityNET	agix	0.187799	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	231696981	0.00383	2023-09-09 14:34:58.468509-04
134	huobi-btc	Huobi BTC	hbtc	25730	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	230792568	-1.62284	2023-09-09 14:34:58.469505-04
135	escoin-token	Escoin	elg	2.73	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	-0.33358	2023-09-09 14:34:58.470502-04
136	sei-network	Sei	sei	0.125544	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	226562797	-1.90047	2023-09-09 14:34:58.471461-04
137	qtum	Qtum	qtum	2.14	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	223834440	0.18111	2023-09-09 14:34:58.472453-04
138	celo	Celo	celo	0.437341	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	223748407	3.70699	2023-09-09 14:34:58.473436-04
139	nem	NEM	xem	0.02464409	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	221798155	0.01777	2023-09-09 14:34:58.474416-04
140	tether-eurt	Euro Tether	eurt	1.074	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221211797	0.28618	2023-09-09 14:34:58.475495-04
141	bitcoin-gold	Bitcoin Gold	btg	12.58	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	220470444	-4.10433	2023-09-09 14:34:58.477127-04
142	akash-network	Akash Network	akt	1.01	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	220179180	-5.00872	2023-09-09 14:34:58.478634-04
143	bone-shibaswap	Bone ShibaSwap	bone	0.95012	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	218445538	2.79712	2023-09-09 14:34:58.479955-04
144	mask-network	Mask Network	mask	2.62	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	215114892	1.45853	2023-09-09 14:34:58.482148-04
145	osmosis	Osmosis	osmo	0.349341	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	214945103	-0.05993	2023-09-09 14:34:58.483949-04
146	helium	Helium	hnt	1.43	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	205506530	-1.83303	2023-09-09 14:34:58.485788-04
147	convex-finance	Convex Finance	cvx	2.56	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	205289737	0.78747	2023-09-09 14:34:58.487697-04
148	zcash	Zcash	zec	25.23	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	204932805	1.3759	2023-09-09 14:34:58.489746-04
149	decred	Decred	dcr	13.24	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	204931219	-0.31307	2023-09-09 14:34:58.491644-04
150	oasis-network	Oasis Network	rose	0.03995115	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	200923833	-0.32232	2023-09-09 14:34:58.493493-04
151	theta-fuel	Theta Fuel	tfuel	0.03164829	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	198856195	-0.16059	2023-09-09 14:34:58.494912-04
152	ethereum-name-service	Ethereum Name Service	ens	7.7	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	198192316	1.19551	2023-09-09 14:34:58.496775-04
153	holotoken	Holo	hot	0.00108331	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	192341145	2.6061	2023-09-09 14:34:58.499011-04
154	olympus	Olympus	ohm	11.1	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	190842387	0.19758	2023-09-09 14:34:58.500955-04
155	cdai	cDAI	cdai	0.022371	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	189958204	-0.11195	2023-09-09 14:34:58.502688-04
156	stepn	STEPN	gmt	0.159805	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	189434185	-0.20247	2023-09-09 14:34:58.504083-04
157	ankr	Ankr Network	ankr	0.01886523	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	188686204	0.59433	2023-09-09 14:34:58.505372-04
158	aleph-zero	Aleph Zero	azero	0.771956	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	185826262	-1.86065	2023-09-09 14:34:58.5066-04
159	jasmycoin	JasmyCoin	jasmy	0.00382602	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	185359253	0.67389	2023-09-09 14:34:58.507785-04
160	just	JUST	jst	0.02069691	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184208333	0.61274	2023-09-09 14:34:58.509112-04
161	livepeer	Livepeer	lpt	6.34	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	183279185	-5.75098	2023-09-09 14:34:58.51033-04
162	beldex	Beldex	bdx	0.03268501	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	182458562	0.04849	2023-09-09 14:34:58.51157-04
163	baby-doge-coin	Baby Doge Coin	babydoge	1.168e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	182383425	5.52389	2023-09-09 14:34:58.513151-04
164	audius	Audius	audio	0.162127	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	180869312	7.0997	2023-09-09 14:34:58.514874-04
165	compound-usdt	cUSDT	cusdt	0.01561362	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	180831308	\N	2023-09-09 14:34:58.516168-04
166	ravencoin	Ravencoin	rvn	0.01506354	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	179358985	0.69675	2023-09-09 14:34:58.517376-04
167	wemix-token	WEMIX	wemix	0.566261	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	179327859	-0.42609	2023-09-09 14:34:58.518542-04
168	yearn-finance	yearn.finance	yfi	5376.96	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	177809046	0.2353	2023-09-09 14:34:58.519718-04
169	aragon	Aragon	ant	4.31	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	172552861	-0.01481	2023-09-09 14:34:58.520748-04
170	kusama	Kusama	ksm	19.17	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	172017230	0.88892	2023-09-09 14:34:58.521763-04
171	floki	FLOKI	floki	1.727e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	171783667	2.04082	2023-09-09 14:34:58.522806-04
172	blur	Blur	blur	0.187118	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	170215680	-0.20087	2023-09-09 14:34:58.523928-04
173	alchemix-usd	Alchemix USD	alusd	0.992545	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167648158	0.14505	2023-09-09 14:34:58.524995-04
174	btse-token	BTSE Token	btse	1.022	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	165587576	2.07377	2023-09-09 14:34:58.526056-04
175	golem	Golem	glm	0.16551	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	165542125	0.06385	2023-09-09 14:34:58.52713-04
176	icon	ICON	icx	0.167391	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	161857800	1.83355	2023-09-09 14:34:58.528359-04
177	waves	Waves	waves	1.61	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	160809606	7.35594	2023-09-09 14:34:58.529495-04
178	swipe	SXP	sxp	0.27222	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	156985864	4.19064	2023-09-09 14:34:58.531337-04
179	terra-luna-2	Terra	luna	0.422945	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	156484632	-1.33045	2023-09-09 14:34:58.532903-04
180	link	FINSCHIA	fnsa	21.89	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	156389776	2.87264	2023-09-09 14:34:58.534109-04
181	worldcoin-wld	Worldcoin	wld	1.16	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	148393899	2.44711	2023-09-09 14:34:58.535185-04
182	aelf	aelf	elf	0.317459	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	146376310	-0.90671	2023-09-09 14:34:58.53631-04
183	siacoin	Siacoin	sc	0.00284189	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	146371687	1.40204	2023-09-09 14:34:58.537371-04
184	balancer	Balancer	bal	3.4	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	146369462	1.61654	2023-09-09 14:34:58.538562-04
185	ethereum-pow-iou	EthereumPoW	ethw	1.35	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	146068812	-0.04439	2023-09-09 14:34:58.539746-04
186	ontology	Ontology	ont	0.163658	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	145932680	0.42772	2023-09-09 14:34:58.540977-04
187	ribbon-finance	Ribbon Finance	rbn	0.185856	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	145656336	-1.05447	2023-09-09 14:34:58.542111-04
188	dao-maker	DAO Maker	dao	0.759451	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	145120292	-0.03531	2023-09-09 14:34:58.5433-04
189	iotex	IoTeX	iotx	0.01534803	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	145018404	2.90635	2023-09-09 14:34:58.544368-04
190	ocean-protocol	Ocean Protocol	ocean	0.327229	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	142058562	-0.15293	2023-09-09 14:34:58.545688-04
191	band-protocol	Band Protocol	band	1.037	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	138761400	-0.33556	2023-09-09 14:34:58.547892-04
192	biconomy	Biconomy	bico	0.210872	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	138679265	0.6661	2023-09-09 14:34:58.549781-04
193	seth2	sETH2	seth2	1629.86	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	138491757	1.00187	2023-09-09 14:34:58.551376-04
194	axelar	Axelar	axl	0.351584	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	137521348	0.6997	2023-09-09 14:34:58.552915-04
195	kadena	Kadena	kda	0.553865	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	136371110	8.12611	2023-09-09 14:34:58.554557-04
196	iostoken	IOST	iost	0.00721361	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	134977290	2.27726	2023-09-09 14:34:58.555859-04
197	merit-circle	Merit Circle	mc	0.290937	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	134495235	0.44667	2023-09-09 14:34:58.557049-04
198	stasis-eurs	STASIS EURO	eurs	1.074	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133347613	0.04432	2023-09-09 14:34:58.558235-04
199	moonbeam	Moonbeam	glmr	0.181948	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	131804917	-0.13051	2023-09-09 14:34:58.559723-04
200	wax	WAX	waxp	0.03917128	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	131264689	0.78584	2023-09-09 14:34:58.561318-04
201	ronin	Ronin	ron	0.513041	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	129049179	0.26983	2023-09-09 14:34:58.562865-04
202	tribe-2	Tribe	tribe	0.267098	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	121521573	0.84281	2023-09-09 14:34:58.56501-04
203	harmony	Harmony	one	0.00985077	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	121138046	2.69827	2023-09-09 14:34:58.566693-04
204	tomochain	TomoChain	tomo	1.24	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	120504039	-5.58693	2023-09-09 14:34:58.568233-04
205	swissborg	SwissBorg	chsb	0.125789	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	119724055	-0.95739	2023-09-09 14:34:58.569581-04
206	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1657.06	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	117552405	0.32711	2023-09-09 14:34:58.570787-04
207	terrausd	TerraClassicUSD	ustc	0.01200626	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	117536350	0.51839	2023-09-09 14:34:58.572046-04
208	magic	Magic	magic	0.495676	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	117198432	-0.27505	2023-09-09 14:34:58.573259-04
209	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	25847	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	115227173	0.43108	2023-09-09 14:34:58.574804-04
210	polymath	Polymath	poly	0.127713	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	114760109	-1.42329	2023-09-09 14:34:58.576113-04
211	open-exchange-token	Open Exchange Token	ox	0.02940792	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	114520122	-7.67693	2023-09-09 14:34:58.577364-04
212	sushi	Sushi	sushi	0.591414	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	114042251	-0.88823	2023-09-09 14:34:58.578567-04
213	bora	BORA	bora	0.113417	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	112688359	0.1492	2023-09-09 14:34:58.580046-04
214	stargate-finance	Stargate Finance	stg	0.541007	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	110566413	0.39872	2023-09-09 14:34:58.581455-04
215	digibyte	DigiByte	dgb	0.00669681	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	110410501	0.38434	2023-09-09 14:34:58.582784-04
216	energy-web-token	Energy Web	ewt	2.32	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	109977940	-0.62011	2023-09-09 14:34:58.58427-04
217	uma	UMA	uma	1.47	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	108687405	5.62888	2023-09-09 14:34:58.585659-04
218	skale	SKALE	skl	0.0230751	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	108442283	1.74383	2023-09-09 14:34:58.586908-04
219	zelcash	Flux	flux	0.33911	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	107579278	-1.49474	2023-09-09 14:34:58.588134-04
220	canvas-n-glr	GalleryCoin	glr	0.444882	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	107178250	4.08873	2023-09-09 14:34:58.589401-04
221	crvusd	crvUSD	crvusd	0.998909	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	105783330	0.32368	2023-09-09 14:34:58.590615-04
222	ssv-network	SSV Network	ssv	14.9	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	105567007	-3.72451	2023-09-09 14:34:58.591792-04
223	msol	Marinade staked SOL	msol	22.02	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	102871238	-0.00281	2023-09-09 14:34:58.593096-04
224	amp-token	Amp	amp	0.00183197	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	102813594	0.38355	2023-09-09 14:34:58.594395-04
225	nucypher	NuCypher	nu	0.056357	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	1.67769	2023-09-09 14:34:58.595621-04
226	hive	Hive	hive	0.275881	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102400356	0.51795	2023-09-09 14:34:58.596969-04
227	zencash	Horizen	zen	7.2	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	101584573	0.1168	2023-09-09 14:34:58.598221-04
228	lisk	Lisk	lsk	0.69817	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	101063783	0.24273	2023-09-09 14:34:58.599436-04
229	api3	API3	api3	1.05	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99806796	-1.27639	2023-09-09 14:34:58.600889-04
459	harmony	Harmony	one	0.00940706	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115905897	1.5347	2023-09-13 19:03:22.255747-04
230	blox	Blox	cdt	0.149121	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	99767474	5.05693	2023-09-09 14:34:58.602716-04
231	echelon-prime	Echelon Prime	prime	4.26	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98547259	6.87204	2023-09-09 14:34:58.604044-04
232	everscale	Everscale	ever	0.054277	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	97955367	2.47958	2023-09-09 14:34:58.605243-04
233	kyber-network-crystal	Kyber Network Crystal	knc	0.534771	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	97224507	-0.0742	2023-09-09 14:34:58.606375-04
234	bitkub-coin	Bitkub Coin	kub	1.084	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	96310587	0.22922	2023-09-09 14:34:58.607565-04
235	nervos-network	Nervos Network	ckb	0.00286856	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	95513739	4.92016	2023-09-09 14:34:58.608667-04
236	centrifuge	Centrifuge	cfg	0.264679	https://assets.coingecko.com/coins/images/15380/large/centrifuge.PNG?1620695821	95250182	5.95295	2023-09-09 14:34:58.609942-04
237	wrapped-centrifuge	Wrapped Centrifuge	wcfg	0.264097	https://assets.coingecko.com/coins/images/17106/large/WCFG.jpg?1626266462	95110263	5.93337	2023-09-09 14:34:58.612668-04
238	gains-network	Gains Network	gns	3.13	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	94885899	-2.4051	2023-09-09 14:34:58.614614-04
239	coinex-token	CoinEx	cet	0.03190125	https://assets.coingecko.com/coins/images/4817/large/coinex-token.png?1547040183	94670073	0.2959	2023-09-09 14:34:58.616493-04
240	lukso-token	LUKSO [OLD]	lyxe	5.82	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	94386992	-5.97292	2023-09-09 14:34:58.618359-04
241	e-radix	e-Radix	exrd	0.061876	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	93638048	9.03719	2023-09-09 14:34:58.620062-04
242	cartesi	Cartesi	ctsi	0.128028	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93556252	3.88968	2023-09-09 14:34:58.621661-04
243	reserve-rights-token	Reserve Rights	rsr	0.00182142	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	92130070	1.15215	2023-09-09 14:34:58.622986-04
244	deso	Decentralized Social	deso	8.73	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	91894111	-1.24615	2023-09-09 14:34:58.624455-04
245	polymesh	Polymesh	polyx	0.106865	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	90845521	1.1897	2023-09-09 14:34:58.625816-04
246	krypton-dao	Krypton DAO	krd	0.884103	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	90582604	-12.87626	2023-09-09 14:34:58.627203-04
247	coredaoorg	Core	core	0.572961	https://assets.coingecko.com/coins/images/28938/large/coredao.png?1675503751	90359821	0.07174	2023-09-09 14:34:58.628809-04
248	edu-coin	Open Campus	edu	0.471585	https://assets.coingecko.com/coins/images/29948/large/EDU_Logo.png?1682327357	88417744	-0.88936	2023-09-09 14:34:58.630862-04
249	origintrail	OriginTrail	trac	0.230781	https://assets.coingecko.com/coins/images/1877/large/TRAC.jpg?1635134367	88342549	-1.70926	2023-09-09 14:34:58.632543-04
250	vulcan-forged	Vulcan Forged	pyr	3.65	https://assets.coingecko.com/coins/images/14770/large/1617088937196.png?1619414736	87270901	1.75573	2023-09-09 14:34:58.63414-04
251	bitcoin	Bitcoin	btc	26241	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	511385152916	1.10602	2023-09-13 19:03:21.925671-04
252	ethereum	Ethereum	eth	1606.78	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193168212243	0.74012	2023-09-13 19:03:21.930889-04
253	tether	Tether	usdt	1	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83035124260	-0.00387	2023-09-13 19:03:21.9324-04
254	binancecoin	BNB	bnb	212.76	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32714970586	0.48058	2023-09-13 19:03:21.933881-04
255	usd-coin	USD Coin	usdc	0.99989	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26212557493	0.13894	2023-09-13 19:03:21.935221-04
256	ripple	XRP	xrp	0.48407	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25704582204	0.37641	2023-09-13 19:03:21.936624-04
257	staked-ether	Lido Staked Ether	steth	1606.27	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13859818647	0.64473	2023-09-13 19:03:21.937989-04
258	cardano	Cardano	ada	0.24894	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8728113423	1.06684	2023-09-13 19:03:21.939313-04
259	dogecoin	Dogecoin	doge	0.06125	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8640097512	0.25665	2023-09-13 19:03:21.941306-04
260	solana	Solana	sol	18.43	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7573147492	2.46768	2023-09-13 19:03:21.943379-04
261	tron	TRON	trx	0.081	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7223539039	-0.15946	2023-09-13 19:03:21.945442-04
262	the-open-network	Toncoin	ton	1.89	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6466214250	2.02158	2023-09-13 19:03:21.947278-04
263	polkadot	Polkadot	dot	4.01	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5114850356	0.23228	2023-09-13 19:03:21.948773-04
264	matic-network	Polygon	matic	0.514013	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4789960661	1.01742	2023-09-13 19:03:21.950114-04
265	litecoin	Litecoin	ltc	62.07	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4575654284	3.17017	2023-09-13 19:03:21.951355-04
266	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4278592179	0.97745	2023-09-13 19:03:21.952537-04
267	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26251	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4275194641	1.09031	2023-09-13 19:03:21.953973-04
268	bitcoin-cash	Bitcoin Cash	bch	200.45	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3908764026	0.3918	2023-09-13 19:03:21.955367-04
269	dai	Dai	dai	0.999051	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3833008490	0.11016	2023-09-13 19:03:21.957372-04
270	leo-token	LEO Token	leo	3.66	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3385388859	-0.27714	2023-09-13 19:03:21.96063-04
271	stellar	Stellar	xlm	0.120761	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3328349284	-0.37264	2023-09-13 19:03:21.962451-04
272	avalanche-2	Avalanche	avax	9.31	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3295226769	0.75472	2023-09-13 19:03:21.964828-04
273	chainlink	Chainlink	link	6.01	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3237715923	0.7447	2023-09-13 19:03:21.966177-04
274	uniswap	Uniswap	uni	4.26	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3209328853	1.16619	2023-09-13 19:03:21.967231-04
275	true-usd	TrueUSD	tusd	0.998442	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3155274975	0.03686	2023-09-13 19:03:21.968519-04
276	monero	Monero	xmr	143.16	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2600178381	1.49553	2023-09-13 19:03:21.969985-04
277	okb	OKB	okb	42.08	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2527407444	0.71912	2023-09-13 19:03:21.971236-04
278	binance-usd	Binance USD	busd	0.999996	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515345024	0.00795	2023-09-13 19:03:21.972315-04
279	ethereum-classic	Ethereum Classic	etc	15.16	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2168075628	0.90571	2023-09-13 19:03:21.97477-04
280	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1914693693	2.40511	2023-09-13 19:03:21.976692-04
281	hedera-hashgraph	Hedera	hbar	0.04950366	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1641652307	5.05375	2023-09-13 19:03:21.978367-04
282	filecoin	Filecoin	fil	3.18	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1423177369	2.69626	2023-09-13 19:03:21.97991-04
283	quant-network	Quant	qnt	92.3	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1341624698	-0.67007	2023-09-13 19:03:21.981164-04
284	crypto-com-chain	Cronos	cro	0.050503	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1325035452	0.49629	2023-09-13 19:03:21.982344-04
285	lido-dao	Lido DAO	ldo	1.49	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1322911695	0.97046	2023-09-13 19:03:21.983541-04
286	mantle	Mantle	mnt	0.407318	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1317366053	-0.02399	2023-09-13 19:03:21.984851-04
287	internet-computer	Internet Computer	icp	2.94	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1303607804	-0.29997	2023-09-13 19:03:21.986044-04
288	aptos	Aptos	apt	5.2	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1223387692	3.00968	2023-09-13 19:03:21.987203-04
289	vechain	VeChain	vet	0.01661853	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1210811795	2.14862	2023-09-13 19:03:21.988468-04
290	optimism	Optimism	op	1.36	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1085059037	1.31921	2023-09-13 19:03:21.990004-04
291	compound-usdt	cUSDT	cusdt	0.092982	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	1065417095	286.67446	2023-09-13 19:03:21.992659-04
292	maker	Maker	mkr	1160.43	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1045103375	3.53394	2023-09-13 19:03:21.994622-04
293	near	NEAR Protocol	near	1.089	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1025215630	1.50137	2023-09-13 19:03:21.996363-04
294	kaspa	Kaspa	kas	0.04939967	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1016615166	15.74687	2023-09-13 19:03:21.997771-04
295	arbitrum	Arbitrum	arb	0.786753	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002906947	0.3684	2023-09-13 19:03:21.99914-04
296	rocket-pool-eth	Rocket Pool ETH	reth	1741.32	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	915969109	0.62134	2023-09-13 19:03:22.000428-04
297	aave	Aave	aave	53.74	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	781115923	1.26387	2023-09-13 19:03:22.001944-04
298	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	760742322	-0.03625	2023-09-13 19:03:22.003374-04
299	the-graph	The Graph	grt	0.082431	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	757862764	3.55427	2023-09-13 19:03:22.004719-04
300	usdd	USDD	usdd	0.998407	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724417412	0.10109	2023-09-13 19:03:22.006117-04
301	xdce-crowd-sale	XDC Network	xdc	0.05201	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	720651800	-1.40192	2023-09-13 19:03:22.008148-04
302	algorand	Algorand	algo	0.090986	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	712567517	1.33154	2023-09-13 19:03:22.010044-04
303	havven	Synthetix Network	snx	2.1	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	677773651	2.37567	2023-09-13 19:03:22.011925-04
304	frax	Frax	frax	0.996738	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669481942	0.23315	2023-09-13 19:03:22.013299-04
305	blockstack	Stacks	stx	0.46042	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	647692244	3.87135	2023-09-13 19:03:22.014691-04
306	eos	EOS	eos	0.554805	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621669788	1.28377	2023-09-13 19:03:22.015935-04
307	bitget-token	Bitget Token	bgb	0.441026	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617261737	-0.1976	2023-09-13 19:03:22.017297-04
308	tezos	Tezos	xtz	0.646329	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	610454253	1.58911	2023-09-13 19:03:22.018702-04
309	elrond-erd-2	MultiversX	egld	23.5	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	610057050	2.13578	2023-09-13 19:03:22.019962-04
310	the-sandbox	The Sandbox	sand	0.291146	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	601200269	2.60085	2023-09-13 19:03:22.021119-04
311	bitcoin-cash-sv	Bitcoin SV	bsv	30.81	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593890945	-0.71163	2023-09-13 19:03:22.022319-04
312	theta-token	Theta Network	theta	0.593165	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	593338015	1.70428	2023-09-13 19:03:22.024083-04
313	radix	Radix	xrd	0.057311	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	587614375	0.39803	2023-09-13 19:03:22.026261-04
314	injective-protocol	Injective	inj	6.92	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	580229068	1.58805	2023-09-13 19:03:22.027876-04
315	immutable-x	ImmutableX	imx	0.494081	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576746084	1.27009	2023-09-13 19:03:22.029706-04
316	render-token	Render	rndr	1.53	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	569629441	2.20142	2023-09-13 19:03:22.031488-04
317	axie-infinity	Axie Infinity	axs	4.27	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	559148771	1.65026	2023-09-13 19:03:22.033037-04
318	fantom	Fantom	ftm	0.192087	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	538558469	2.18173	2023-09-13 19:03:22.034694-04
319	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	528800204	-0.0017	2023-09-13 19:03:22.03586-04
320	paxos-standard	Pax Dollar	usdp	0.99946	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517739020	0.04687	2023-09-13 19:03:22.037191-04
321	decentraland	Decentraland	mana	0.280088	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516614501	3.3957	2023-09-13 19:03:22.038459-04
322	neo	NEO	neo	7.3	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	514507054	3.33781	2023-09-13 19:03:22.039759-04
323	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	481889770	7.18274	2023-09-13 19:03:22.041693-04
324	compound-ether	cETH	ceth	32.28	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476172748	0.30481	2023-09-13 19:03:22.044192-04
325	kava	Kava	kava	0.617996	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472480103	1.41842	2023-09-13 19:03:22.045978-04
326	rollbit-coin	Rollbit Coin	rlb	0.142559	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	471076594	-4.22076	2023-09-13 19:03:22.047387-04
327	tether-gold	Tether Gold	xaut	1910	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470852628	-0.08932	2023-09-13 19:03:22.048717-04
328	pax-gold	PAX Gold	paxg	1889.02	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	468886776	-0.21572	2023-09-13 19:03:22.050001-04
329	iota	IOTA	miota	0.168621	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	468506899	4.11937	2023-09-13 19:03:22.051252-04
330	ecash	eCash	xec	2.301e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	449067641	1.19833	2023-09-13 19:03:22.052567-04
331	rocket-pool	Rocket Pool	rpl	22.15	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	436497645	-0.23472	2023-09-13 19:03:22.053827-04
332	flow	Flow	flow	0.418333	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	434015803	2.12976	2023-09-13 19:03:22.055081-04
333	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423143111	0.95661	2023-09-13 19:03:22.056244-04
334	frax-ether	Frax Ether	frxeth	1603.55	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415922116	0.65552	2023-09-13 19:03:22.058465-04
335	tokenize-xchange	Tokenize Xchange	tkx	5.19	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	413836632	0.60586	2023-09-13 19:03:22.060397-04
336	kucoin-shares	KuCoin	kcs	4.24	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	410946117	3.07359	2023-09-13 19:03:22.062395-04
337	first-digital-usd	First Digital USD	fdusd	0.999522	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393959484	0.05995	2023-09-13 19:03:22.064005-04
338	chiliz	Chiliz	chz	0.056426	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393766183	0.96225	2023-09-13 19:03:22.065342-04
339	frax-share	Frax Share	fxs	5.33	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	392272666	4.1294	2023-09-13 19:03:22.066827-04
340	klay-token	Klaytn	klay	0.121809	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	388527479	-1.7552	2023-09-13 19:03:22.068177-04
341	huobi-token	Huobi	ht	2.37	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	378320753	1.13454	2023-09-13 19:03:22.069584-04
342	casper-network	Casper Network	cspr	0.03279923	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	371252388	0.15822	2023-09-13 19:03:22.070674-04
343	bittorrent	BitTorrent	btt	3.88357e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368996431	-0.76717	2023-09-13 19:03:22.072174-04
344	gala	GALA	gala	0.01406187	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368502916	0.57168	2023-09-13 19:03:22.074459-04
345	curve-dao-token	Curve DAO	crv	0.41523	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365357699	3.65538	2023-09-13 19:03:22.076449-04
346	mina-protocol	Mina Protocol	mina	0.37494	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362430701	1.26728	2023-09-13 19:03:22.078278-04
347	sui	Sui	sui	0.442121	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	349546465	3.05116	2023-09-13 19:03:22.079698-04
348	dydx	dYdX	dydx	1.93	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339196014	1.9759	2023-09-13 19:03:22.080832-04
349	terra-luna	Terra Luna Classic	lunc	5.806e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	338800479	1.37845	2023-09-13 19:03:22.082102-04
350	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1684.23	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	332817985	0.6484	2023-09-13 19:03:22.083474-04
351	trust-wallet-token	Trust Wallet	twt	0.781564	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	325577741	0.13064	2023-09-13 19:03:22.084688-04
352	nexo	NEXO	nexo	0.561789	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	314989742	-0.73357	2023-09-13 19:03:22.085899-04
353	nxm	Nexus Mutual	nxm	46.08	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311163412	0.74636	2023-09-13 19:03:22.087196-04
354	gemini-dollar	Gemini Dollar	gusd	0.999177	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307452378	0.03558	2023-09-13 19:03:22.088527-04
355	apenft	APENFT	nft	3.03653e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300244461	0.50664	2023-09-13 19:03:22.090017-04
356	dash	Dash	dash	25.67	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	294373293	1.48574	2023-09-13 19:03:22.092634-04
357	staked-frax-ether	Staked Frax Ether	sfrxeth	1695.08	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293175130	0.70883	2023-09-13 19:03:22.094478-04
358	gmx	GMX	gmx	31.64	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285586155	1.01896	2023-09-13 19:03:22.09655-04
359	pepe	Pepe	pepe	6.76699e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284551955	0.39102	2023-09-13 19:03:22.098033-04
360	liquity-usd	Liquity USD	lusd	0.996726	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282632237	0.1709	2023-09-13 19:03:22.099722-04
361	astar	Astar	astr	0.053203	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	280294062	-5.98886	2023-09-13 19:03:22.101457-04
362	woo-network	WOO Network	woo	0.158403	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	277088384	2.81684	2023-09-13 19:03:22.103163-04
363	zilliqa	Zilliqa	zil	0.01611857	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	273111807	6.31951	2023-09-13 19:03:22.104737-04
364	compound-governance-token	Compound	comp	39.49	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	270623809	7.05761	2023-09-13 19:03:22.106098-04
365	arweave	Arweave	ar	4.07	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	266505779	2.26683	2023-09-13 19:03:22.107901-04
366	flare-networks	Flare	flr	0.01128284	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	264291851	-3.66829	2023-09-13 19:03:22.111086-04
367	compound-usd-coin	cUSDC	cusdc	0.02304133	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264039143	-0.03101	2023-09-13 19:03:22.113178-04
368	defichain	DeFiChain	dfi	0.351614	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262383218	5.97862	2023-09-13 19:03:22.114663-04
369	safepal	SafePal	sfp	0.614769	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258575203	5.79366	2023-09-13 19:03:22.116076-04
370	gnosis	Gnosis	gno	98.99	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257217364	0.68931	2023-09-13 19:03:22.117457-04
371	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255375972	0.38636	2023-09-13 19:03:22.118714-04
372	basic-attention-token	Basic Attention	bat	0.166783	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248944228	2.92501	2023-09-13 19:03:22.120027-04
373	1inch	1inch	1inch	0.234463	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241325867	2.39086	2023-09-13 19:03:22.121091-04
374	conflux-token	Conflux	cfx	0.114007	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	239187448	1.57826	2023-09-13 19:03:22.122655-04
375	chia	Chia	xch	28.26	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238579057	2.82142	2023-09-13 19:03:22.125405-04
376	fetch-ai	Fetch.ai	fet	0.224168	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234186358	-1.12183	2023-09-13 19:03:22.127561-04
377	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233648379	1.33208	2023-09-13 19:03:22.129696-04
378	oec-token	OKT Chain	okt	13.06	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	232988493	-0.2583	2023-09-13 19:03:22.13097-04
379	illuvium	Illuvium	ilv	39.89	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232747267	-0.42876	2023-09-13 19:03:22.132178-04
380	huobi-btc	Huobi BTC	hbtc	25900	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	232439123	-0.33681	2023-09-13 19:03:22.133549-04
381	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.36803	2023-09-13 19:03:22.13483-04
382	ecomi	ECOMI	omi	0.00084272	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	228563696	0.76555	2023-09-13 19:03:22.136016-04
383	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	227178375	-2.22438	2023-09-13 19:03:22.137231-04
384	enjincoin	Enjin Coin	enj	0.223424	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223423731	-1.57266	2023-09-13 19:03:22.138475-04
385	singularitynet	SingularityNET	agix	0.180146	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	222018170	3.56274	2023-09-13 19:03:22.139864-04
386	tether-eurt	Euro Tether	eurt	1.073	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221056185	-0.15083	2023-09-13 19:03:22.142226-04
387	loopring	Loopring	lrc	0.177209	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220934091	1.54889	2023-09-13 19:03:22.14391-04
388	nem	NEM	xem	0.02445604	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220107361	1.20839	2023-09-13 19:03:22.14533-04
389	bitcoin-gold	Bitcoin Gold	btg	12.54	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219820513	-4.9899	2023-09-13 19:03:22.146606-04
390	qtum	Qtum	qtum	2.1	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219702245	1.82379	2023-09-13 19:03:22.147667-04
391	celo	Celo	celo	0.421458	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216175237	1.0513	2023-09-13 19:03:22.148783-04
392	sei-network	Sei	sei	0.119292	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214795181	0.66383	2023-09-13 19:03:22.149923-04
393	zcash	Zcash	zec	25.39	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205405077	2.03826	2023-09-13 19:03:22.151065-04
394	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204979906	2.1981	2023-09-13 19:03:22.152454-04
395	decred	Decred	dcr	13.02	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	201411301	3.34976	2023-09-13 19:03:22.15369-04
396	osmosis	Osmosis	osmo	0.325475	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200666443	0.54691	2023-09-13 19:03:22.154761-04
397	helium	Helium	hnt	1.39	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	199618741	-1.90694	2023-09-13 19:03:22.156083-04
398	oasis-network	Oasis Network	rose	0.03937211	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	198115225	3.0386	2023-09-13 19:03:22.158376-04
399	theta-fuel	Theta Fuel	tfuel	0.03080172	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193284119	1.40523	2023-09-13 19:03:22.16142-04
400	olympus	Olympus	ohm	11.13	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192948399	0.32387	2023-09-13 19:03:22.163218-04
401	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192672019	0.98625	2023-09-13 19:03:22.16446-04
402	bone-shibaswap	Bone ShibaSwap	bone	0.822148	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	188966516	-1.70488	2023-09-13 19:03:22.165757-04
403	holotoken	Holo	hot	0.00105103	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186864770	0.83013	2023-09-13 19:03:22.167222-04
404	akash-network	Akash Network	akt	0.852883	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186727340	-6.72028	2023-09-13 19:03:22.168652-04
405	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	186145194	1.19345	2023-09-13 19:03:22.169944-04
406	just	JUST	jst	0.02076046	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184837910	0.50749	2023-09-13 19:03:22.171101-04
407	cdai	cDAI	cdai	0.02238428	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	184826165	0.05505	2023-09-13 19:03:22.172774-04
408	aleph-zero	Aleph Zero	azero	0.765091	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184353723	-1.93447	2023-09-13 19:03:22.175111-04
409	ankr	Ankr Network	ankr	0.01824377	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182592433	3.57148	2023-09-13 19:03:22.177968-04
410	wemix-token	WEMIX	wemix	0.56057	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177703017	-1.17925	2023-09-13 19:03:22.179899-04
411	beldex	Beldex	bdx	0.03176782	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177426090	-0.43719	2023-09-13 19:03:22.181326-04
412	yearn-finance	yearn.finance	yfi	5318.81	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175936211	2.57211	2023-09-13 19:03:22.182736-04
413	livepeer	Livepeer	lpt	6.02	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174787820	1.08322	2023-09-13 19:03:22.184033-04
414	ravencoin	Ravencoin	rvn	0.01459311	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173280700	0.78078	2023-09-13 19:03:22.185436-04
415	stepn	STEPN	gmt	0.145482	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172829464	0.53693	2023-09-13 19:03:22.18662-04
416	aelf	aelf	elf	0.369687	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170547595	5.86058	2023-09-13 19:03:22.18791-04
417	alchemix-usd	Alchemix USD	alusd	0.991618	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167552729	0.01883	2023-09-13 19:03:22.189392-04
418	golem	Golem	glm	0.166578	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	166644794	2.66612	2023-09-13 19:03:22.19184-04
419	aragon	Aragon	ant	4.15	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	166454298	-0.63036	2023-09-13 19:03:22.193478-04
420	jasmycoin	JasmyCoin	jasmy	0.00343195	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166312370	-1.19341	2023-09-13 19:03:22.194791-04
421	audius	Audius	audio	0.146213	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162869243	1.59941	2023-09-13 19:03:22.196006-04
422	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	0.03692	2023-09-13 19:03:22.19727-04
423	kusama	Kusama	ksm	18	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161558409	0.78739	2023-09-13 19:03:22.198503-04
424	baby-doge-coin	Baby Doge Coin	babydoge	1.024e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	160002107	-1.15025	2023-09-13 19:03:22.199794-04
425	blur	Blur	blur	0.173558	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159960404	1.78449	2023-09-13 19:03:22.201052-04
426	floki	FLOKI	floki	1.6e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	159105528	0.86547	2023-09-13 19:03:22.202277-04
427	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	155025206	1.78028	2023-09-13 19:03:22.203631-04
428	icon	ICON	icx	0.159367	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154082987	2.97214	2023-09-13 19:03:22.204658-04
429	iotex	IoTeX	iotx	0.0157533	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148953859	2.77447	2023-09-13 19:03:22.205844-04
430	link	FINSCHIA	fnsa	20.68	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	148073355	-0.87515	2023-09-13 19:03:22.207357-04
431	terra-luna-2	Terra	luna	0.391157	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146494318	-0.21574	2023-09-13 19:03:22.210087-04
432	swipe	SXP	sxp	0.253471	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146440654	3.34252	2023-09-13 19:03:22.212211-04
433	dao-maker	DAO Maker	dao	0.740881	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141572210	0.72471	2023-09-13 19:03:22.214717-04
434	siacoin	Siacoin	sc	0.00273775	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141256347	1.61783	2023-09-13 19:03:22.216457-04
435	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141000327	-0.14196	2023-09-13 19:03:22.217828-04
436	ontology	Ontology	ont	0.157142	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140259577	2.94455	2023-09-13 19:03:22.219207-04
437	balancer	Balancer	bal	3.22	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138505617	0.85766	2023-09-13 19:03:22.220455-04
438	ribbon-finance	Ribbon Finance	rbn	0.175439	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	137943651	-3.04227	2023-09-13 19:03:22.221653-04
439	ocean-protocol	Ocean Protocol	ocean	0.313156	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	136006718	1.08881	2023-09-13 19:03:22.223242-04
440	seth2	sETH2	seth2	1593.89	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135476605	0.63237	2023-09-13 19:03:22.226165-04
441	axelar	Axelar	axl	0.341081	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135334252	-1.62249	2023-09-13 19:03:22.227995-04
442	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133130325	-0.10748	2023-09-13 19:03:22.229601-04
443	band-protocol	Band Protocol	band	0.996321	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	132926601	2.08065	2023-09-13 19:03:22.23104-04
444	worldcoin-wld	Worldcoin	wld	1.017	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	132145451	-0.22895	2023-09-13 19:03:22.232378-04
445	biconomy	Biconomy	bico	0.198663	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	130572071	0.28113	2023-09-13 19:03:22.233713-04
446	iostoken	IOST	iost	0.0068739	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128816447	1.7685	2023-09-13 19:03:22.234885-04
447	open-exchange-token	Open Exchange Token	ox	0.03255369	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	126809510	14.65832	2023-09-13 19:03:22.236111-04
448	wax	WAX	waxp	0.03772179	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126750165	2.03472	2023-09-13 19:03:22.237351-04
449	kadena	Kadena	kda	0.517341	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	126708535	-0.35573	2023-09-13 19:03:22.238624-04
450	merit-circle	Merit Circle	mc	0.264674	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	122843635	-0.81595	2023-09-13 19:03:22.239999-04
451	moonbeam	Moonbeam	glmr	0.164967	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	120851716	-1.3191	2023-09-13 19:03:22.242304-04
452	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.60057	2023-09-13 19:03:22.244581-04
453	ronin	Ronin	ron	0.477354	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120451559	-0.49115	2023-09-13 19:03:22.246285-04
454	tomochain	TomoChain	tomo	1.24	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119985144	2.59801	2023-09-13 19:03:22.248382-04
455	terrausd	TerraClassicUSD	ustc	0.01205336	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118955171	-1.09087	2023-09-13 19:03:22.249987-04
456	sushi	Sushi	sushi	0.612321	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118357428	4.88375	2023-09-13 19:03:22.251591-04
457	swissborg	SwissBorg	chsb	0.123102	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117262539	0.54128	2023-09-13 19:03:22.253213-04
458	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26225	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	116145791	0.98263	2023-09-13 19:03:22.254404-04
460	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1630.96	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115710416	0.59113	2023-09-13 19:03:22.257174-04
461	tribe-2	Tribe	tribe	0.252646	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	114984535	-1.03329	2023-09-13 19:03:22.260155-04
462	crvusd	crvUSD	crvusd	0.997599	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111375567	0.13285	2023-09-13 19:03:22.263261-04
463	bora	BORA	bora	0.111824	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	111181186	1.70973	2023-09-13 19:03:22.265237-04
464	skale	SKALE	skl	0.02354148	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110401260	6.35006	2023-09-13 19:03:22.266828-04
465	magic	Magic	magic	0.465832	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110264658	5.56764	2023-09-13 19:03:22.268739-04
466	polymath	Polymath	poly	0.121264	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108975888	0.10675	2023-09-13 19:03:22.270268-04
467	ssv-network	SSV Network	ssv	15.25	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	108065404	2.33174	2023-09-13 19:03:22.271537-04
468	digibyte	DigiByte	dgb	0.00643965	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106894048	3.44381	2023-09-13 19:03:22.272757-04
469	blox	Blox	cdt	0.134331	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	106103202	-0.18438	2023-09-13 19:03:22.27501-04
470	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104465200	0.98598	2023-09-13 19:03:22.277233-04
471	hive	Hive	hive	0.276666	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102761965	2.85684	2023-09-13 19:03:22.279081-04
472	zelcash	Flux	flux	0.323043	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102599287	0.95633	2023-09-13 19:03:22.280703-04
473	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.45962	2023-09-13 19:03:22.282193-04
474	lisk	Lisk	lsk	0.705435	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	102186851	3.81544	2023-09-13 19:03:22.283467-04
475	api3	API3	api3	1.052	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99994570	3.12271	2023-09-13 19:03:22.284667-04
476	vethor-token	VeThor	vtho	0.00155346	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99727146	49.18635	2023-09-13 19:03:22.285893-04
477	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	98951411	1.27708	2023-09-13 19:03:22.286891-04
478	zencash	Horizen	zen	6.99	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98750090	1.81341	2023-09-13 19:03:22.288003-04
479	echelon-prime	Echelon Prime	prime	4.23	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98318105	1.35286	2023-09-13 19:03:22.289204-04
480	msol	Marinade staked SOL	msol	20.89	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97587715	2.32734	2023-09-13 19:03:22.291394-04
481	gains-network	Gains Network	gns	3.19	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	96574791	5.65183	2023-09-13 19:03:22.293781-04
482	metal	Metal DAO	mtl	1.47	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96408713	8.96429	2023-09-13 19:03:22.295783-04
483	amp-token	Amp	amp	0.00170553	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95672913	-1.19916	2023-09-13 19:03:22.297575-04
484	kyber-network-crystal	Kyber Network Crystal	knc	0.51819	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94010409	3.10374	2023-09-13 19:03:22.298909-04
485	reserve-rights-token	Reserve Rights	rsr	0.00185305	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93730067	6.01024	2023-09-13 19:03:22.300184-04
486	cartesi	Cartesi	ctsi	0.127539	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93393419	7.6418	2023-09-13 19:03:22.301446-04
487	everscale	Everscale	ever	0.051772	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93389811	-2.85038	2023-09-13 19:03:22.302738-04
488	stargate-finance	Stargate Finance	stg	0.450855	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92304315	-0.65069	2023-09-13 19:03:22.304062-04
489	bitkub-coin	Bitkub Coin	kub	1.017	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90501930	0.13704	2023-09-13 19:03:22.305291-04
490	krypton-dao	Krypton DAO	krd	0.875617	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89694628	-3.17715	2023-09-13 19:03:22.30679-04
491	deso	Decentralized Social	deso	8.5	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89289588	-0.84472	2023-09-13 19:03:22.309712-04
492	nervos-network	Nervos Network	ckb	0.00266668	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89215131	1.93793	2023-09-13 19:03:22.312502-04
493	polymesh	Polymesh	polyx	0.104729	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89181481	1.57667	2023-09-13 19:03:22.314187-04
494	lukso-token	LUKSO [OLD]	lyxe	5.6	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	88420058	-0.4848	2023-09-13 19:03:22.315585-04
495	e-radix	e-Radix	exrd	0.057362	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86913509	0.69091	2023-09-13 19:03:22.316837-04
496	stp-network	STP	stpt	0.04412036	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85681815	3.58208	2023-09-13 19:03:22.318044-04
497	status	Status	snt	0.02158063	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85433292	1.47851	2023-09-13 19:03:22.319237-04
498	pundi-x-2	Pundi X	pundix	0.323793	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83722121	2.32127	2023-09-13 19:03:22.320601-04
499	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83700197	-0.4509	2023-09-13 19:03:22.3218-04
500	joe	JOE	joe	0.244691	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83478181	0.91087	2023-09-13 19:03:22.324113-04
501	bitcoin	Bitcoin	btc	26241	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	511385152916	1.10602	2023-09-13 19:03:28.13553-04
502	ethereum	Ethereum	eth	1606.78	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193168212243	0.74012	2023-09-13 19:03:28.137383-04
503	tether	Tether	usdt	1	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83035124260	-0.00387	2023-09-13 19:03:28.138546-04
504	binancecoin	BNB	bnb	212.76	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32714970586	0.48058	2023-09-13 19:03:28.14004-04
505	usd-coin	USD Coin	usdc	0.99989	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26212557493	0.13894	2023-09-13 19:03:28.142653-04
506	ripple	XRP	xrp	0.48407	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25704582204	0.37641	2023-09-13 19:03:28.144275-04
507	staked-ether	Lido Staked Ether	steth	1606.27	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13859818647	0.64473	2023-09-13 19:03:28.14657-04
508	cardano	Cardano	ada	0.24894	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8728113423	1.06684	2023-09-13 19:03:28.14797-04
509	dogecoin	Dogecoin	doge	0.06125	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8640097512	0.25665	2023-09-13 19:03:28.149291-04
510	solana	Solana	sol	18.43	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7573147492	2.46768	2023-09-13 19:03:28.150648-04
511	tron	TRON	trx	0.081	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7223539039	-0.15946	2023-09-13 19:03:28.151924-04
512	the-open-network	Toncoin	ton	1.89	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6466214250	2.02158	2023-09-13 19:03:28.153098-04
513	polkadot	Polkadot	dot	4.01	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5114850356	0.23228	2023-09-13 19:03:28.154271-04
514	matic-network	Polygon	matic	0.514013	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4789960661	1.01742	2023-09-13 19:03:28.15534-04
515	litecoin	Litecoin	ltc	62.07	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4575654284	3.17017	2023-09-13 19:03:28.156571-04
516	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4278592179	0.97745	2023-09-13 19:03:28.158949-04
517	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26251	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4275194641	1.09031	2023-09-13 19:03:28.160888-04
518	bitcoin-cash	Bitcoin Cash	bch	200.45	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3908764026	0.3918	2023-09-13 19:03:28.162649-04
519	dai	Dai	dai	0.999051	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3833008490	0.11016	2023-09-13 19:03:28.164185-04
520	leo-token	LEO Token	leo	3.66	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3385388859	-0.27714	2023-09-13 19:03:28.165535-04
521	stellar	Stellar	xlm	0.120761	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3328349284	-0.37264	2023-09-13 19:03:28.166984-04
522	avalanche-2	Avalanche	avax	9.31	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3295226769	0.75472	2023-09-13 19:03:28.169383-04
523	chainlink	Chainlink	link	6.01	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3237715923	0.7447	2023-09-13 19:03:28.170638-04
524	uniswap	Uniswap	uni	4.26	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3209328853	1.16619	2023-09-13 19:03:28.171862-04
525	true-usd	TrueUSD	tusd	0.998442	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3155274975	0.03686	2023-09-13 19:03:28.173412-04
526	monero	Monero	xmr	143.16	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2600178381	1.49553	2023-09-13 19:03:28.176051-04
527	okb	OKB	okb	42.08	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2527407444	0.71912	2023-09-13 19:03:28.178098-04
528	binance-usd	Binance USD	busd	0.999996	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515345024	0.00795	2023-09-13 19:03:28.179664-04
529	ethereum-classic	Ethereum Classic	etc	15.16	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2168075628	0.90571	2023-09-13 19:03:28.180893-04
530	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1914693693	2.40511	2023-09-13 19:03:28.182134-04
531	hedera-hashgraph	Hedera	hbar	0.04950366	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1641652307	5.05375	2023-09-13 19:03:28.183573-04
532	filecoin	Filecoin	fil	3.18	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1423177369	2.69626	2023-09-13 19:03:28.184777-04
533	quant-network	Quant	qnt	92.3	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1341624698	-0.67007	2023-09-13 19:03:28.185919-04
534	crypto-com-chain	Cronos	cro	0.050503	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1325035452	0.49629	2023-09-13 19:03:28.187115-04
535	lido-dao	Lido DAO	ldo	1.49	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1322911695	0.97046	2023-09-13 19:03:28.188491-04
536	mantle	Mantle	mnt	0.407318	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1317366053	-0.02399	2023-09-13 19:03:28.190051-04
537	internet-computer	Internet Computer	icp	2.94	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1303607804	-0.29997	2023-09-13 19:03:28.192404-04
538	aptos	Aptos	apt	5.2	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1223387692	3.00968	2023-09-13 19:03:28.196042-04
539	vechain	VeChain	vet	0.01661853	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1210811795	2.14862	2023-09-13 19:03:28.199054-04
540	optimism	Optimism	op	1.36	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1085059037	1.31921	2023-09-13 19:03:28.200794-04
541	compound-usdt	cUSDT	cusdt	0.092982	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	1065417095	286.67446	2023-09-13 19:03:28.20267-04
542	maker	Maker	mkr	1160.43	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1045103375	3.53394	2023-09-13 19:03:28.20446-04
543	near	NEAR Protocol	near	1.089	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1025215630	1.50137	2023-09-13 19:03:28.205991-04
544	kaspa	Kaspa	kas	0.04939967	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1016615166	15.74687	2023-09-13 19:03:28.207809-04
545	arbitrum	Arbitrum	arb	0.786753	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002906947	0.3684	2023-09-13 19:03:28.211536-04
546	rocket-pool-eth	Rocket Pool ETH	reth	1741.32	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	915969109	0.62134	2023-09-13 19:03:28.213912-04
547	aave	Aave	aave	53.74	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	781115923	1.26387	2023-09-13 19:03:28.215436-04
548	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	760742322	-0.03625	2023-09-13 19:03:28.217326-04
549	the-graph	The Graph	grt	0.082431	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	757862764	3.55427	2023-09-13 19:03:28.219435-04
550	usdd	USDD	usdd	0.998407	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724417412	0.10109	2023-09-13 19:03:28.220711-04
551	xdce-crowd-sale	XDC Network	xdc	0.05201	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	720651800	-1.40192	2023-09-13 19:03:28.222007-04
552	algorand	Algorand	algo	0.090986	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	712567517	1.33154	2023-09-13 19:03:28.223709-04
553	havven	Synthetix Network	snx	2.1	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	677773651	2.37567	2023-09-13 19:03:28.226877-04
554	frax	Frax	frax	0.996738	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669481942	0.23315	2023-09-13 19:03:28.229606-04
555	blockstack	Stacks	stx	0.46042	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	647692244	3.87135	2023-09-13 19:03:28.233271-04
556	eos	EOS	eos	0.554805	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621669788	1.28377	2023-09-13 19:03:28.235503-04
557	bitget-token	Bitget Token	bgb	0.441026	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617261737	-0.1976	2023-09-13 19:03:28.238079-04
558	tezos	Tezos	xtz	0.646329	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	610454253	1.58911	2023-09-13 19:03:28.239883-04
559	elrond-erd-2	MultiversX	egld	23.5	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	610057050	2.13578	2023-09-13 19:03:28.243164-04
560	the-sandbox	The Sandbox	sand	0.291146	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	601200269	2.60085	2023-09-13 19:03:28.246296-04
561	bitcoin-cash-sv	Bitcoin SV	bsv	30.81	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593890945	-0.71163	2023-09-13 19:03:28.248426-04
562	theta-token	Theta Network	theta	0.593165	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	593338015	1.70428	2023-09-13 19:03:28.249924-04
563	radix	Radix	xrd	0.057311	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	587614375	0.39803	2023-09-13 19:03:28.251456-04
564	injective-protocol	Injective	inj	6.92	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	580229068	1.58805	2023-09-13 19:03:28.252932-04
565	immutable-x	ImmutableX	imx	0.494081	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576746084	1.27009	2023-09-13 19:03:28.254152-04
566	render-token	Render	rndr	1.53	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	569629441	2.20142	2023-09-13 19:03:28.255274-04
567	axie-infinity	Axie Infinity	axs	4.27	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	559148771	1.65026	2023-09-13 19:03:28.25693-04
568	fantom	Fantom	ftm	0.192087	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	538558469	2.18173	2023-09-13 19:03:28.260519-04
569	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	528800204	-0.0017	2023-09-13 19:03:28.26361-04
570	paxos-standard	Pax Dollar	usdp	0.99946	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517739020	0.04687	2023-09-13 19:03:28.266407-04
571	decentraland	Decentraland	mana	0.280088	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516614501	3.3957	2023-09-13 19:03:28.268456-04
572	neo	NEO	neo	7.3	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	514507054	3.33781	2023-09-13 19:03:28.270405-04
573	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	481889770	7.18274	2023-09-13 19:03:28.271802-04
574	compound-ether	cETH	ceth	32.28	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476172748	0.30481	2023-09-13 19:03:28.273499-04
575	kava	Kava	kava	0.617996	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472480103	1.41842	2023-09-13 19:03:28.276365-04
576	rollbit-coin	Rollbit Coin	rlb	0.142559	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	471076594	-4.22076	2023-09-13 19:03:28.278752-04
577	tether-gold	Tether Gold	xaut	1910	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470852628	-0.08932	2023-09-13 19:03:28.280794-04
578	pax-gold	PAX Gold	paxg	1889.02	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	468886776	-0.21572	2023-09-13 19:03:28.28224-04
579	iota	IOTA	miota	0.168621	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	468506899	4.11937	2023-09-13 19:03:28.283333-04
580	ecash	eCash	xec	2.301e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	449067641	1.19833	2023-09-13 19:03:28.284505-04
581	rocket-pool	Rocket Pool	rpl	22.15	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	436497645	-0.23472	2023-09-13 19:03:28.285478-04
582	flow	Flow	flow	0.418333	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	434015803	2.12976	2023-09-13 19:03:28.286699-04
583	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423143111	0.95661	2023-09-13 19:03:28.287879-04
584	frax-ether	Frax Ether	frxeth	1603.55	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415922116	0.65552	2023-09-13 19:03:28.288772-04
585	tokenize-xchange	Tokenize Xchange	tkx	5.19	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	413836632	0.60586	2023-09-13 19:03:28.289792-04
586	kucoin-shares	KuCoin	kcs	4.24	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	410946117	3.07359	2023-09-13 19:03:28.291887-04
587	first-digital-usd	First Digital USD	fdusd	0.999522	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393959484	0.05995	2023-09-13 19:03:28.295053-04
588	chiliz	Chiliz	chz	0.056426	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393766183	0.96225	2023-09-13 19:03:28.297706-04
589	frax-share	Frax Share	fxs	5.33	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	392272666	4.1294	2023-09-13 19:03:28.300118-04
590	klay-token	Klaytn	klay	0.121809	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	388527479	-1.7552	2023-09-13 19:03:28.302511-04
591	huobi-token	Huobi	ht	2.37	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	378320753	1.13454	2023-09-13 19:03:28.30436-04
592	casper-network	Casper Network	cspr	0.03279923	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	371252388	0.15822	2023-09-13 19:03:28.306258-04
593	bittorrent	BitTorrent	btt	3.88357e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368996431	-0.76717	2023-09-13 19:03:28.311467-04
594	gala	GALA	gala	0.01406187	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368502916	0.57168	2023-09-13 19:03:28.314158-04
595	curve-dao-token	Curve DAO	crv	0.41523	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365357699	3.65538	2023-09-13 19:03:28.31659-04
596	mina-protocol	Mina Protocol	mina	0.37494	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362430701	1.26728	2023-09-13 19:03:28.318709-04
597	sui	Sui	sui	0.442121	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	349546465	3.05116	2023-09-13 19:03:28.320503-04
598	dydx	dYdX	dydx	1.93	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339196014	1.9759	2023-09-13 19:03:28.321856-04
599	terra-luna	Terra Luna Classic	lunc	5.806e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	338800479	1.37845	2023-09-13 19:03:28.323434-04
600	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1684.23	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	332817985	0.6484	2023-09-13 19:03:28.326668-04
601	trust-wallet-token	Trust Wallet	twt	0.781564	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	325577741	0.13064	2023-09-13 19:03:28.328976-04
602	nexo	NEXO	nexo	0.561789	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	314989742	-0.73357	2023-09-13 19:03:28.330655-04
603	nxm	Nexus Mutual	nxm	46.08	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311163412	0.74636	2023-09-13 19:03:28.332225-04
604	gemini-dollar	Gemini Dollar	gusd	0.999177	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307452378	0.03558	2023-09-13 19:03:28.333551-04
605	apenft	APENFT	nft	3.03653e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300244461	0.50664	2023-09-13 19:03:28.334802-04
606	dash	Dash	dash	25.67	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	294373293	1.48574	2023-09-13 19:03:28.336118-04
607	staked-frax-ether	Staked Frax Ether	sfrxeth	1695.08	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293175130	0.70883	2023-09-13 19:03:28.337467-04
608	gmx	GMX	gmx	31.64	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285586155	1.01896	2023-09-13 19:03:28.338904-04
609	pepe	Pepe	pepe	6.76699e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284551955	0.39102	2023-09-13 19:03:28.340809-04
610	liquity-usd	Liquity USD	lusd	0.996726	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282632237	0.1709	2023-09-13 19:03:28.343678-04
611	astar	Astar	astr	0.053203	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	280294062	-5.98886	2023-09-13 19:03:28.345946-04
612	woo-network	WOO Network	woo	0.158403	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	277088384	2.81684	2023-09-13 19:03:28.347678-04
613	zilliqa	Zilliqa	zil	0.01611857	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	273111807	6.31951	2023-09-13 19:03:28.349037-04
614	compound-governance-token	Compound	comp	39.49	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	270623809	7.05761	2023-09-13 19:03:28.350284-04
615	arweave	Arweave	ar	4.07	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	266505779	2.26683	2023-09-13 19:03:28.351578-04
616	flare-networks	Flare	flr	0.01128284	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	264291851	-3.66829	2023-09-13 19:03:28.352792-04
617	compound-usd-coin	cUSDC	cusdc	0.02304133	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264039143	-0.03101	2023-09-13 19:03:28.354042-04
618	defichain	DeFiChain	dfi	0.351614	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262383218	5.97862	2023-09-13 19:03:28.355299-04
619	safepal	SafePal	sfp	0.614769	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258575203	5.79366	2023-09-13 19:03:28.356553-04
620	gnosis	Gnosis	gno	98.99	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257217364	0.68931	2023-09-13 19:03:28.359363-04
621	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255375972	0.38636	2023-09-13 19:03:28.361386-04
622	basic-attention-token	Basic Attention	bat	0.166783	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248944228	2.92501	2023-09-13 19:03:28.362772-04
623	1inch	1inch	1inch	0.234463	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241325867	2.39086	2023-09-13 19:03:28.364038-04
624	conflux-token	Conflux	cfx	0.114007	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	239187448	1.57826	2023-09-13 19:03:28.365227-04
625	chia	Chia	xch	28.26	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238579057	2.82142	2023-09-13 19:03:28.366387-04
626	fetch-ai	Fetch.ai	fet	0.224168	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234186358	-1.12183	2023-09-13 19:03:28.367458-04
627	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233648379	1.33208	2023-09-13 19:03:28.368538-04
628	oec-token	OKT Chain	okt	13.06	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	232988493	-0.2583	2023-09-13 19:03:28.369575-04
629	illuvium	Illuvium	ilv	39.89	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232747267	-0.42876	2023-09-13 19:03:28.370686-04
630	huobi-btc	Huobi BTC	hbtc	25900	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	232439123	-0.33681	2023-09-13 19:03:28.371781-04
631	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.36803	2023-09-13 19:03:28.372856-04
632	ecomi	ECOMI	omi	0.00084272	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	228563696	0.76555	2023-09-13 19:03:28.374423-04
633	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	227178375	-2.22438	2023-09-13 19:03:28.377545-04
634	enjincoin	Enjin Coin	enj	0.223424	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223423731	-1.57266	2023-09-13 19:03:28.379923-04
635	singularitynet	SingularityNET	agix	0.180146	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	222018170	3.56274	2023-09-13 19:03:28.381476-04
636	tether-eurt	Euro Tether	eurt	1.073	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221056185	-0.15083	2023-09-13 19:03:28.382933-04
637	loopring	Loopring	lrc	0.177209	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220934091	1.54889	2023-09-13 19:03:28.384624-04
638	nem	NEM	xem	0.02445604	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220107361	1.20839	2023-09-13 19:03:28.386338-04
639	bitcoin-gold	Bitcoin Gold	btg	12.54	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219820513	-4.9899	2023-09-13 19:03:28.387994-04
640	qtum	Qtum	qtum	2.1	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219702245	1.82379	2023-09-13 19:03:28.389781-04
641	celo	Celo	celo	0.421458	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216175237	1.0513	2023-09-13 19:03:28.391908-04
642	sei-network	Sei	sei	0.119292	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214795181	0.66383	2023-09-13 19:03:28.393596-04
1008	cardano	Cardano	ada	0.248911	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8730039032	1.02407	2023-09-13 19:28:15.857088-04
643	zcash	Zcash	zec	25.39	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205405077	2.03826	2023-09-13 19:03:28.395015-04
644	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204979906	2.1981	2023-09-13 19:03:28.396299-04
645	decred	Decred	dcr	13.02	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	201411301	3.34976	2023-09-13 19:03:28.397625-04
646	osmosis	Osmosis	osmo	0.325475	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200666443	0.54691	2023-09-13 19:03:28.398916-04
647	helium	Helium	hnt	1.39	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	199618741	-1.90694	2023-09-13 19:03:28.400042-04
648	oasis-network	Oasis Network	rose	0.03937211	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	198115225	3.0386	2023-09-13 19:03:28.401035-04
649	theta-fuel	Theta Fuel	tfuel	0.03080172	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193284119	1.40523	2023-09-13 19:03:28.402084-04
650	olympus	Olympus	ohm	11.13	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192948399	0.32387	2023-09-13 19:03:28.403028-04
651	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192672019	0.98625	2023-09-13 19:03:28.40407-04
652	bone-shibaswap	Bone ShibaSwap	bone	0.822148	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	188966516	-1.70488	2023-09-13 19:03:28.405015-04
653	holotoken	Holo	hot	0.00105103	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186864770	0.83013	2023-09-13 19:03:28.406221-04
654	akash-network	Akash Network	akt	0.852883	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186727340	-6.72028	2023-09-13 19:03:28.408542-04
655	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	186145194	1.19345	2023-09-13 19:03:28.410253-04
656	just	JUST	jst	0.02076046	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184837910	0.50749	2023-09-13 19:03:28.41154-04
657	cdai	cDAI	cdai	0.02238428	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	184826165	0.05505	2023-09-13 19:03:28.412757-04
658	aleph-zero	Aleph Zero	azero	0.765091	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184353723	-1.93447	2023-09-13 19:03:28.413913-04
659	ankr	Ankr Network	ankr	0.01824377	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182592433	3.57148	2023-09-13 19:03:28.414987-04
660	wemix-token	WEMIX	wemix	0.56057	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177703017	-1.17925	2023-09-13 19:03:28.416186-04
661	beldex	Beldex	bdx	0.03176782	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177426090	-0.43719	2023-09-13 19:03:28.417258-04
662	yearn-finance	yearn.finance	yfi	5318.81	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175936211	2.57211	2023-09-13 19:03:28.418361-04
663	livepeer	Livepeer	lpt	6.02	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174787820	1.08322	2023-09-13 19:03:28.419434-04
664	ravencoin	Ravencoin	rvn	0.01459311	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173280700	0.78078	2023-09-13 19:03:28.420438-04
665	stepn	STEPN	gmt	0.145482	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172829464	0.53693	2023-09-13 19:03:28.421625-04
666	aelf	aelf	elf	0.369687	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170547595	5.86058	2023-09-13 19:03:28.422863-04
667	alchemix-usd	Alchemix USD	alusd	0.991618	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167552729	0.01883	2023-09-13 19:03:28.425508-04
668	golem	Golem	glm	0.166578	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	166644794	2.66612	2023-09-13 19:03:28.428468-04
669	aragon	Aragon	ant	4.15	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	166454298	-0.63036	2023-09-13 19:03:28.429951-04
670	jasmycoin	JasmyCoin	jasmy	0.00343195	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166312370	-1.19341	2023-09-13 19:03:28.431316-04
671	audius	Audius	audio	0.146213	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162869243	1.59941	2023-09-13 19:03:28.432722-04
672	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	0.03692	2023-09-13 19:03:28.434003-04
673	kusama	Kusama	ksm	18	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161558409	0.78739	2023-09-13 19:03:28.435107-04
674	baby-doge-coin	Baby Doge Coin	babydoge	1.024e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	160002107	-1.15025	2023-09-13 19:03:28.436283-04
675	blur	Blur	blur	0.173558	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159960404	1.78449	2023-09-13 19:03:28.437405-04
676	floki	FLOKI	floki	1.6e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	159105528	0.86547	2023-09-13 19:03:28.438426-04
677	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	155025206	1.78028	2023-09-13 19:03:28.439642-04
678	icon	ICON	icx	0.159367	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154082987	2.97214	2023-09-13 19:03:28.441849-04
679	iotex	IoTeX	iotx	0.0157533	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148953859	2.77447	2023-09-13 19:03:28.444067-04
680	link	FINSCHIA	fnsa	20.68	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	148073355	-0.87515	2023-09-13 19:03:28.445433-04
681	terra-luna-2	Terra	luna	0.391157	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146494318	-0.21574	2023-09-13 19:03:28.447021-04
682	swipe	SXP	sxp	0.253471	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146440654	3.34252	2023-09-13 19:03:28.449009-04
683	dao-maker	DAO Maker	dao	0.740881	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141572210	0.72471	2023-09-13 19:03:28.450446-04
684	siacoin	Siacoin	sc	0.00273775	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141256347	1.61783	2023-09-13 19:03:28.452301-04
685	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141000327	-0.14196	2023-09-13 19:03:28.454039-04
686	ontology	Ontology	ont	0.157142	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140259577	2.94455	2023-09-13 19:03:28.455734-04
687	balancer	Balancer	bal	3.22	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138505617	0.85766	2023-09-13 19:03:28.457983-04
688	ribbon-finance	Ribbon Finance	rbn	0.175439	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	137943651	-3.04227	2023-09-13 19:03:28.46015-04
689	ocean-protocol	Ocean Protocol	ocean	0.313156	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	136006718	1.08881	2023-09-13 19:03:28.462526-04
690	seth2	sETH2	seth2	1593.89	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135476605	0.63237	2023-09-13 19:03:28.46417-04
691	axelar	Axelar	axl	0.341081	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135334252	-1.62249	2023-09-13 19:03:28.46547-04
692	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133130325	-0.10748	2023-09-13 19:03:28.466883-04
693	band-protocol	Band Protocol	band	0.996321	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	132926601	2.08065	2023-09-13 19:03:28.468431-04
694	worldcoin-wld	Worldcoin	wld	1.017	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	132145451	-0.22895	2023-09-13 19:03:28.469915-04
695	biconomy	Biconomy	bico	0.198663	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	130572071	0.28113	2023-09-13 19:03:28.471166-04
696	iostoken	IOST	iost	0.0068739	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128816447	1.7685	2023-09-13 19:03:28.472547-04
697	open-exchange-token	Open Exchange Token	ox	0.03255369	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	126809510	14.65832	2023-09-13 19:03:28.474864-04
698	wax	WAX	waxp	0.03772179	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126750165	2.03472	2023-09-13 19:03:28.476452-04
699	kadena	Kadena	kda	0.517341	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	126708535	-0.35573	2023-09-13 19:03:28.477906-04
700	merit-circle	Merit Circle	mc	0.264674	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	122843635	-0.81595	2023-09-13 19:03:28.479241-04
701	moonbeam	Moonbeam	glmr	0.164967	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	120851716	-1.3191	2023-09-13 19:03:28.480452-04
702	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.60057	2023-09-13 19:03:28.481896-04
703	ronin	Ronin	ron	0.477354	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120451559	-0.49115	2023-09-13 19:03:28.483194-04
704	tomochain	TomoChain	tomo	1.24	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119985144	2.59801	2023-09-13 19:03:28.484474-04
705	terrausd	TerraClassicUSD	ustc	0.01205336	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118955171	-1.09087	2023-09-13 19:03:28.485761-04
706	sushi	Sushi	sushi	0.612321	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118357428	4.88375	2023-09-13 19:03:28.487177-04
707	swissborg	SwissBorg	chsb	0.123102	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117262539	0.54128	2023-09-13 19:03:28.488631-04
708	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26225	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	116145791	0.98263	2023-09-13 19:03:28.490829-04
709	harmony	Harmony	one	0.00940706	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115905897	1.5347	2023-09-13 19:03:28.492892-04
710	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1630.96	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115710416	0.59113	2023-09-13 19:03:28.494621-04
711	tribe-2	Tribe	tribe	0.252646	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	114984535	-1.03329	2023-09-13 19:03:28.495911-04
712	crvusd	crvUSD	crvusd	0.997599	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111375567	0.13285	2023-09-13 19:03:28.4972-04
713	bora	BORA	bora	0.111824	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	111181186	1.70973	2023-09-13 19:03:28.498337-04
714	skale	SKALE	skl	0.02354148	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110401260	6.35006	2023-09-13 19:03:28.50016-04
715	magic	Magic	magic	0.465832	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110264658	5.56764	2023-09-13 19:03:28.501415-04
716	polymath	Polymath	poly	0.121264	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108975888	0.10675	2023-09-13 19:03:28.502667-04
717	ssv-network	SSV Network	ssv	15.25	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	108065404	2.33174	2023-09-13 19:03:28.503836-04
718	digibyte	DigiByte	dgb	0.00643965	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106894048	3.44381	2023-09-13 19:03:28.50493-04
719	blox	Blox	cdt	0.134331	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	106103202	-0.18438	2023-09-13 19:03:28.506153-04
720	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104465200	0.98598	2023-09-13 19:03:28.508615-04
721	hive	Hive	hive	0.276666	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102761965	2.85684	2023-09-13 19:03:28.510485-04
722	zelcash	Flux	flux	0.323043	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102599287	0.95633	2023-09-13 19:03:28.512113-04
723	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.45962	2023-09-13 19:03:28.5136-04
724	lisk	Lisk	lsk	0.705435	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	102186851	3.81544	2023-09-13 19:03:28.514935-04
725	api3	API3	api3	1.052	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99994570	3.12271	2023-09-13 19:03:28.516194-04
726	vethor-token	VeThor	vtho	0.00155346	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99727146	49.18635	2023-09-13 19:03:28.517458-04
727	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	98951411	1.27708	2023-09-13 19:03:28.518775-04
728	zencash	Horizen	zen	6.99	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98750090	1.81341	2023-09-13 19:03:28.52011-04
729	echelon-prime	Echelon Prime	prime	4.23	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98318105	1.35286	2023-09-13 19:03:28.521465-04
730	msol	Marinade staked SOL	msol	20.89	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97587715	2.32734	2023-09-13 19:03:28.522666-04
731	gains-network	Gains Network	gns	3.19	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	96574791	5.65183	2023-09-13 19:03:28.524623-04
732	metal	Metal DAO	mtl	1.47	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96408713	8.96429	2023-09-13 19:03:28.52702-04
733	amp-token	Amp	amp	0.00170553	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95672913	-1.19916	2023-09-13 19:03:28.529164-04
734	kyber-network-crystal	Kyber Network Crystal	knc	0.51819	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94010409	3.10374	2023-09-13 19:03:28.530922-04
735	reserve-rights-token	Reserve Rights	rsr	0.00185305	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93730067	6.01024	2023-09-13 19:03:28.53275-04
736	cartesi	Cartesi	ctsi	0.127539	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93393419	7.6418	2023-09-13 19:03:28.534208-04
737	everscale	Everscale	ever	0.051772	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93389811	-2.85038	2023-09-13 19:03:28.535523-04
738	stargate-finance	Stargate Finance	stg	0.450855	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92304315	-0.65069	2023-09-13 19:03:28.536859-04
739	bitkub-coin	Bitkub Coin	kub	1.017	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90501930	0.13704	2023-09-13 19:03:28.538235-04
740	krypton-dao	Krypton DAO	krd	0.875617	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89694628	-3.17715	2023-09-13 19:03:28.53957-04
741	deso	Decentralized Social	deso	8.5	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89289588	-0.84472	2023-09-13 19:03:28.542071-04
742	nervos-network	Nervos Network	ckb	0.00266668	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89215131	1.93793	2023-09-13 19:03:28.544026-04
743	polymesh	Polymesh	polyx	0.104729	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89181481	1.57667	2023-09-13 19:03:28.545756-04
744	lukso-token	LUKSO [OLD]	lyxe	5.6	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	88420058	-0.4848	2023-09-13 19:03:28.547261-04
745	e-radix	e-Radix	exrd	0.057362	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86913509	0.69091	2023-09-13 19:03:28.548553-04
746	stp-network	STP	stpt	0.04412036	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85681815	3.58208	2023-09-13 19:03:28.549794-04
747	status	Status	snt	0.02158063	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85433292	1.47851	2023-09-13 19:03:28.551345-04
748	pundi-x-2	Pundi X	pundix	0.323793	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83722121	2.32127	2023-09-13 19:03:28.552729-04
749	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83700197	-0.4509	2023-09-13 19:03:28.554138-04
750	joe	JOE	joe	0.244691	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83478181	0.91087	2023-09-13 19:03:28.555679-04
751	bitcoin	Bitcoin	btc	26227	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	511508652947	1.22906	2023-09-13 19:28:05.497496-04
752	ethereum	Ethereum	eth	1607.65	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193431699129	0.6973	2023-09-13 19:28:05.49956-04
753	tether	Tether	usdt	0.999721	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83008585433	-0.07522	2023-09-13 19:28:05.500916-04
754	binancecoin	BNB	bnb	212.63	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32732050445	0.39414	2023-09-13 19:28:05.502247-04
755	usd-coin	USD Coin	usdc	0.999174	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26205284093	-0.18416	2023-09-13 19:28:05.50372-04
756	ripple	XRP	xrp	0.484167	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25719480828	0.7458	2023-09-13 19:28:05.505582-04
757	staked-ether	Lido Staked Ether	steth	1606.86	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13869855299	0.71696	2023-09-13 19:28:05.507845-04
758	cardano	Cardano	ada	0.248891	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8730039032	1.01624	2023-09-13 19:28:05.510434-04
759	dogecoin	Dogecoin	doge	0.06128	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8645966340	0.42635	2023-09-13 19:28:05.513174-04
760	solana	Solana	sol	18.38	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7562442101	2.18709	2023-09-13 19:28:05.515473-04
761	tron	TRON	trx	0.081093	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7233938441	0.22666	2023-09-13 19:28:05.516815-04
762	the-open-network	Toncoin	ton	1.89	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6507989431	1.94792	2023-09-13 19:28:05.51805-04
763	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5108572689	0.25822	2023-09-13 19:28:05.519275-04
764	matic-network	Polygon	matic	0.513668	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4792822962	1.15402	2023-09-13 19:28:05.520724-04
765	litecoin	Litecoin	ltc	62.01	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4573752025	3.129	2023-09-13 19:28:05.522279-04
766	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4280315001	1.00212	2023-09-13 19:28:05.524526-04
767	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26244	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4276410989	1.26591	2023-09-13 19:28:05.527378-04
768	bitcoin-cash	Bitcoin Cash	bch	200.09	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3912747710	0.5026	2023-09-13 19:28:05.529136-04
769	dai	Dai	dai	0.999213	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3837655440	0.02671	2023-09-13 19:28:05.531053-04
770	leo-token	LEO Token	leo	3.65	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3389049069	-0.25628	2023-09-13 19:28:05.532496-04
771	stellar	Stellar	xlm	0.120609	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3323400399	-0.59898	2023-09-13 19:28:05.533919-04
772	avalanche-2	Avalanche	avax	9.31	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3298013800	0.90466	2023-09-13 19:28:05.535348-04
773	chainlink	Chainlink	link	6.01	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3239487325	0.66989	2023-09-13 19:28:05.536958-04
774	uniswap	Uniswap	uni	4.26	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3209138486	1.0523	2023-09-13 19:28:05.538619-04
775	true-usd	TrueUSD	tusd	0.997626	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3153941157	-0.15245	2023-09-13 19:28:05.540483-04
776	monero	Monero	xmr	143.14	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2599574805	1.51882	2023-09-13 19:28:05.544058-04
777	okb	OKB	okb	42.09	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2526678988	1.05856	2023-09-13 19:28:05.546628-04
778	binance-usd	Binance USD	busd	1	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2514964058	-0.09943	2023-09-13 19:28:05.54843-04
779	ethereum-classic	Ethereum Classic	etc	15.16	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2169714696	1.10662	2023-09-13 19:28:05.54986-04
780	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1915033609	2.43649	2023-09-13 19:28:05.551227-04
781	hedera-hashgraph	Hedera	hbar	0.0496835	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1649487492	5.40489	2023-09-13 19:28:05.552527-04
782	filecoin	Filecoin	fil	3.18	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1419945609	2.59209	2023-09-13 19:28:05.553781-04
783	quant-network	Quant	qnt	92.47	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1345340384	-0.44027	2023-09-13 19:28:05.555181-04
784	crypto-com-chain	Cronos	cro	0.050557	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326988829	0.67507	2023-09-13 19:28:05.556445-04
785	lido-dao	Lido DAO	ldo	1.49	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1323668718	0.88329	2023-09-13 19:28:05.558644-04
786	mantle	Mantle	mnt	0.40703	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316968665	0.00375	2023-09-13 19:28:05.561163-04
787	internet-computer	Internet Computer	icp	2.94	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1305829926	-0.16905	2023-09-13 19:28:05.563437-04
788	aptos	Aptos	apt	5.21	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1224900096	3.22859	2023-09-13 19:28:05.565915-04
789	vechain	VeChain	vet	0.01659784	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1207016158	1.2832	2023-09-13 19:28:05.56805-04
790	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1083331622	0.97439	2023-09-13 19:28:05.570135-04
791	compound-usdt	cUSDT	cusdt	0.02800299	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	1054280415	16.45331	2023-09-13 19:28:05.571979-04
792	maker	Maker	mkr	1158.15	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1045567832	3.20275	2023-09-13 19:28:05.57361-04
793	near	NEAR Protocol	near	1.089	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1026908329	1.84437	2023-09-13 19:28:05.576492-04
794	kaspa	Kaspa	kas	0.04886527	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1008765581	15.18405	2023-09-13 19:28:05.579108-04
795	arbitrum	Arbitrum	arb	0.786906	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1004615236	-0.04731	2023-09-13 19:28:05.581371-04
796	rocket-pool-eth	Rocket Pool ETH	reth	1741.83	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	916819831	0.67953	2023-09-13 19:28:05.583661-04
797	aave	Aave	aave	53.7	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	781218379	1.15783	2023-09-13 19:28:05.58579-04
798	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	760759775	-0.1054	2023-09-13 19:28:05.58756-04
799	the-graph	The Graph	grt	0.082539	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	758251771	3.78202	2023-09-13 19:28:05.589504-04
800	usdd	USDD	usdd	0.99763	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724066930	-0.0674	2023-09-13 19:28:05.592747-04
801	xdce-crowd-sale	XDC Network	xdc	0.052157	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	721708643	-1.22496	2023-09-13 19:28:05.596535-04
802	algorand	Algorand	algo	0.090931	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	713405274	1.42277	2023-09-13 19:28:05.598591-04
803	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	678457331	2.12456	2023-09-13 19:28:05.600689-04
804	frax	Frax	frax	0.995384	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	668920257	-0.05443	2023-09-13 19:28:05.602381-04
805	blockstack	Stacks	stx	0.45968	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	647161462	3.90364	2023-09-13 19:28:05.60461-04
806	eos	EOS	eos	0.555382	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	622762548	1.44593	2023-09-13 19:28:05.606297-04
807	bitget-token	Bitget Token	bgb	0.440795	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617342731	-0.29134	2023-09-13 19:28:05.609324-04
808	elrond-erd-2	MultiversX	egld	23.5	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	610196262	2.22351	2023-09-13 19:28:05.611192-04
809	tezos	Tezos	xtz	0.645242	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	609156601	1.59411	2023-09-13 19:28:05.613999-04
810	the-sandbox	The Sandbox	sand	0.290714	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	600963322	2.74851	2023-09-13 19:28:05.616256-04
811	bitcoin-cash-sv	Bitcoin SV	bsv	30.81	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	594252028	-0.84007	2023-09-13 19:28:05.618957-04
812	theta-token	Theta Network	theta	0.592074	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	592574967	1.77634	2023-09-13 19:28:05.62067-04
813	radix	Radix	xrd	0.057027	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	585154892	-0.03784	2023-09-13 19:28:05.622251-04
814	injective-protocol	Injective	inj	6.92	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	579657171	1.48554	2023-09-13 19:28:05.625698-04
815	immutable-x	ImmutableX	imx	0.494068	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	577558038	1.57434	2023-09-13 19:28:05.627794-04
816	render-token	Render	rndr	1.53	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	568136496	1.11454	2023-09-13 19:28:05.629772-04
817	axie-infinity	Axie Infinity	axs	4.26	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	558848271	1.64697	2023-09-13 19:28:05.631818-04
818	fantom	Fantom	ftm	0.191784	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	538344216	2.27051	2023-09-13 19:28:05.633755-04
819	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529443880	-0.03746	2023-09-13 19:28:05.635696-04
820	paxos-standard	Pax Dollar	usdp	0.998708	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517780478	-0.14515	2023-09-13 19:28:05.637845-04
821	decentraland	Decentraland	mana	0.28009	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	517269306	3.63981	2023-09-13 19:28:05.640447-04
822	neo	NEO	neo	7.29	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	514763927	3.37142	2023-09-13 19:28:05.64327-04
823	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	482217882	7.50533	2023-09-13 19:28:05.646554-04
824	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:28:05.648693-04
825	kava	Kava	kava	0.618803	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472862039	1.49159	2023-09-13 19:28:05.650809-04
826	tether-gold	Tether Gold	xaut	1908.72	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470323530	-0.10341	2023-09-13 19:28:05.652535-04
827	iota	IOTA	miota	0.168635	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	469306769	4.54156	2023-09-13 19:28:05.654291-04
828	pax-gold	PAX Gold	paxg	1888.54	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	468890467	-0.22928	2023-09-13 19:28:05.656015-04
829	rollbit-coin	Rollbit Coin	rlb	0.142071	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	468701031	-4.83418	2023-09-13 19:28:05.657699-04
830	ecash	eCash	xec	2.297e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	448703116	1.795	2023-09-13 19:28:05.661219-04
831	rocket-pool	Rocket Pool	rpl	22.17	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	436596542	0.02241	2023-09-13 19:28:05.663537-04
832	flow	Flow	flow	0.418407	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433583748	2.49935	2023-09-13 19:28:05.666098-04
833	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	424613667	1.24042	2023-09-13 19:28:05.668705-04
834	frax-ether	Frax Ether	frxeth	1604	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	416368566	0.66286	2023-09-13 19:28:05.670689-04
835	tokenize-xchange	Tokenize Xchange	tkx	5.18	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414466487	0.48386	2023-09-13 19:28:05.675321-04
836	kucoin-shares	KuCoin	kcs	4.26	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	410757698	3.17939	2023-09-13 19:28:05.677169-04
837	chiliz	Chiliz	chz	0.0565	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	394328827	1.10879	2023-09-13 19:28:05.678812-04
838	first-digital-usd	First Digital USD	fdusd	0.998173	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393699974	-0.14438	2023-09-13 19:28:05.680235-04
839	frax-share	Frax Share	fxs	5.33	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	392212273	4.23677	2023-09-13 19:28:05.681418-04
840	klay-token	Klaytn	klay	0.121584	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	387895768	-1.8859	2023-09-13 19:28:05.68258-04
841	huobi-token	Huobi	ht	2.37	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376930367	0.87104	2023-09-13 19:28:05.683694-04
842	casper-network	Casper Network	cspr	0.03278514	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	371171346	0.33038	2023-09-13 19:28:05.684725-04
843	bittorrent	BitTorrent	btt	3.88306e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	369265186	0.3687	2023-09-13 19:28:05.68566-04
844	gala	GALA	gala	0.01407971	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	369134969	0.90528	2023-09-13 19:28:05.686543-04
845	curve-dao-token	Curve DAO	crv	0.415833	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365440021	3.79592	2023-09-13 19:28:05.687489-04
846	mina-protocol	Mina Protocol	mina	0.375809	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	364007063	1.81028	2023-09-13 19:28:05.688339-04
847	sui	Sui	sui	0.441884	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	350478982	3.34742	2023-09-13 19:28:05.689437-04
848	dydx	dYdX	dydx	1.94	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	340055245	2.3053	2023-09-13 19:28:05.691312-04
849	terra-luna	Terra Luna Classic	lunc	5.797e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	338423885	1.16043	2023-09-13 19:28:05.693152-04
850	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1685.56	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333466319	0.74152	2023-09-13 19:28:05.694237-04
851	trust-wallet-token	Trust Wallet	twt	0.782193	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	326066032	0.32168	2023-09-13 19:28:05.69536-04
852	nexo	NEXO	nexo	0.561441	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319891888	-0.68678	2023-09-13 19:28:05.696324-04
853	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.74636	2023-09-13 19:28:05.697192-04
854	gemini-dollar	Gemini Dollar	gusd	0.999449	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307576566	-0.01107	2023-09-13 19:28:05.698022-04
855	apenft	APENFT	nft	3.03375e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300284558	0.60427	2023-09-13 19:28:05.698992-04
856	dash	Dash	dash	25.64	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293930570	1.44397	2023-09-13 19:28:05.699962-04
857	staked-frax-ether	Staked Frax Ether	sfrxeth	1696.08	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293434742	0.76852	2023-09-13 19:28:05.700892-04
858	gmx	GMX	gmx	31.66	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285457524	0.94138	2023-09-13 19:28:05.701867-04
859	pepe	Pepe	pepe	6.75565e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	285129139	0.50529	2023-09-13 19:28:05.70281-04
860	liquity-usd	Liquity USD	lusd	0.996592	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282594709	0.09559	2023-09-13 19:28:05.703813-04
861	astar	Astar	astr	0.053217	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	280253338	-5.38367	2023-09-13 19:28:05.704753-04
862	woo-network	WOO Network	woo	0.158244	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	277406386	2.16001	2023-09-13 19:28:05.705788-04
863	zilliqa	Zilliqa	zil	0.01611301	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	274229955	6.14985	2023-09-13 19:28:05.706848-04
864	compound-governance-token	Compound	comp	39.58	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271804182	7.43966	2023-09-13 19:28:05.709452-04
865	arweave	Arweave	ar	4.04	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	265473642	1.55769	2023-09-13 19:28:05.711705-04
866	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:28:05.713445-04
867	flare-networks	Flare	flr	0.01125308	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263878352	-3.88817	2023-09-13 19:28:05.714426-04
868	defichain	DeFiChain	dfi	0.351248	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262383838	5.80705	2023-09-13 19:28:05.715304-04
869	safepal	SafePal	sfp	0.615231	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	259012696	5.55073	2023-09-13 19:28:05.716879-04
870	gnosis	Gnosis	gno	99.17	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257113535	1.01961	2023-09-13 19:28:05.718501-04
871	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255584072	0.47324	2023-09-13 19:28:05.719889-04
872	basic-attention-token	Basic Attention	bat	0.166891	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248684787	3.06196	2023-09-13 19:28:05.720874-04
873	1inch	1inch	1inch	0.234527	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241668126	2.6274	2023-09-13 19:28:05.721735-04
874	conflux-token	Conflux	cfx	0.113769	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	239033258	1.05844	2023-09-13 19:28:05.722583-04
875	chia	Chia	xch	28.26	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238969185	2.85844	2023-09-13 19:28:05.723573-04
876	fetch-ai	Fetch.ai	fet	0.224697	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234673710	-0.35422	2023-09-13 19:28:05.726474-04
877	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233936659	1.30248	2023-09-13 19:28:05.728296-04
878	illuvium	Illuvium	ilv	39.93	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	233475229	-0.10908	2023-09-13 19:28:05.729694-04
879	oec-token	OKT Chain	okt	13.07	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233255376	-0.34184	2023-09-13 19:28:05.731143-04
880	huobi-btc	Huobi BTC	hbtc	25816	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231937090	-0.3778	2023-09-13 19:28:05.732621-04
881	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.41004	2023-09-13 19:28:05.733774-04
882	ecomi	ECOMI	omi	0.00084032	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227674688	0.49856	2023-09-13 19:28:05.735016-04
883	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226894016	-2.08205	2023-09-13 19:28:05.736396-04
884	enjincoin	Enjin Coin	enj	0.223544	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223810042	-1.80001	2023-09-13 19:28:05.737588-04
885	singularitynet	SingularityNET	agix	0.18	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	222204972	3.61796	2023-09-13 19:28:05.738725-04
886	loopring	Loopring	lrc	0.177194	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220988437	1.55565	2023-09-13 19:28:05.740116-04
887	tether-eurt	Euro Tether	eurt	1.073	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	220976083	-0.45867	2023-09-13 19:28:05.742806-04
888	nem	NEM	xem	0.0244762	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220406982	1.63878	2023-09-13 19:28:05.74417-04
889	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219768606	1.73649	2023-09-13 19:28:05.745377-04
890	bitcoin-gold	Bitcoin Gold	btg	13.13	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219600449	-0.36318	2023-09-13 19:28:05.746542-04
891	celo	Celo	celo	0.422732	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216723422	1.62462	2023-09-13 19:28:05.747782-04
892	sei-network	Sei	sei	0.119649	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	215569226	1.11255	2023-09-13 19:28:05.749023-04
893	zcash	Zcash	zec	25.38	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205389954	2.15061	2023-09-13 19:28:05.750383-04
894	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	205000168	2.4443	2023-09-13 19:28:05.751569-04
895	osmosis	Osmosis	osmo	0.325839	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200786290	0.83959	2023-09-13 19:28:05.752795-04
896	decred	Decred	dcr	12.93	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200309596	2.79297	2023-09-13 19:28:05.753896-04
897	helium	Helium	hnt	1.39	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	199617134	-2.46802	2023-09-13 19:28:05.755156-04
898	oasis-network	Oasis Network	rose	0.03922576	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197403369	2.794	2023-09-13 19:28:05.756395-04
899	theta-fuel	Theta Fuel	tfuel	0.03075923	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193287739	2.13706	2023-09-13 19:28:05.758097-04
900	olympus	Olympus	ohm	11.13	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192956238	-0.14661	2023-09-13 19:28:05.760561-04
901	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192181892	1.13681	2023-09-13 19:28:05.76257-04
902	bone-shibaswap	Bone ShibaSwap	bone	0.822447	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189138238	-1.80204	2023-09-13 19:28:05.764169-04
903	akash-network	Akash Network	akt	0.854985	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186992316	-6.3099	2023-09-13 19:28:05.765732-04
904	holotoken	Holo	hot	0.00105156	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186938104	0.96858	2023-09-13 19:28:05.767518-04
905	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	186083642	1.23563	2023-09-13 19:28:05.76905-04
906	just	JUST	jst	0.02076146	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184805642	0.7562	2023-09-13 19:28:05.770314-04
907	aleph-zero	Aleph Zero	azero	0.765269	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184746543	-1.94155	2023-09-13 19:28:05.771538-04
908	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:28:05.772834-04
909	ankr	Ankr Network	ankr	0.01824067	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182767410	3.69881	2023-09-13 19:28:05.775031-04
910	wemix-token	WEMIX	wemix	0.560354	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177687972	-0.69814	2023-09-13 19:28:05.777348-04
911	beldex	Beldex	bdx	0.0317707	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177412592	-0.26046	2023-09-13 19:28:05.778924-04
912	yearn-finance	yearn.finance	yfi	5313.18	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175703067	2.46004	2023-09-13 19:28:05.780568-04
913	livepeer	Livepeer	lpt	6.03	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174954526	1.28444	2023-09-13 19:28:05.7817-04
914	ravencoin	Ravencoin	rvn	0.01460211	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	174129000	1.02531	2023-09-13 19:28:05.782891-04
915	stepn	STEPN	gmt	0.145447	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172920002	0.53161	2023-09-13 19:28:05.784264-04
916	aelf	aelf	elf	0.369904	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170721029	6.23144	2023-09-13 19:28:05.785723-04
917	alchemix-usd	Alchemix USD	alusd	0.99122	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167595098	-0.19198	2023-09-13 19:28:05.787222-04
918	golem	Golem	glm	0.166661	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	166622042	2.71594	2023-09-13 19:28:05.788699-04
919	jasmycoin	JasmyCoin	jasmy	0.00343431	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166600302	-0.96747	2023-09-13 19:28:05.789953-04
920	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	166154930	-0.96598	2023-09-13 19:28:05.792089-04
921	audius	Audius	audio	0.146363	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	163066666	1.82119	2023-09-13 19:28:05.793589-04
922	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.09426	2023-09-13 19:28:05.794734-04
923	kusama	Kusama	ksm	18	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161697638	0.91997	2023-09-13 19:28:05.795731-04
924	blur	Blur	blur	0.17376	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	160151041	2.31563	2023-09-13 19:28:05.796844-04
925	floki	FLOKI	floki	1.6e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	159217536	1.37938	2023-09-13 19:28:05.798182-04
926	baby-doge-coin	Baby Doge Coin	babydoge	1.018e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	159133592	-1.86729	2023-09-13 19:28:05.7994-04
927	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	155037222	2.15677	2023-09-13 19:28:05.800702-04
928	icon	ICON	icx	0.159034	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	153996728	2.84851	2023-09-13 19:28:05.801926-04
929	iotex	IoTeX	iotx	0.01575002	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148875019	2.6656	2023-09-13 19:28:05.803026-04
930	link	FINSCHIA	fnsa	20.69	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	148133025	-0.81693	2023-09-13 19:28:05.8041-04
931	swipe	SXP	sxp	0.25438	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146698684	3.8257	2023-09-13 19:28:05.80505-04
932	terra-luna-2	Terra	luna	0.391104	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146420919	0.0436	2023-09-13 19:28:05.806017-04
933	dao-maker	DAO Maker	dao	0.740637	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141531369	0.73751	2023-09-13 19:28:05.807753-04
934	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141116008	-0.34569	2023-09-13 19:28:05.809633-04
935	siacoin	Siacoin	sc	0.00273941	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141114911	0.98064	2023-09-13 19:28:05.811239-04
936	ontology	Ontology	ont	0.157046	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140333376	3.05309	2023-09-13 19:28:05.812828-04
937	balancer	Balancer	bal	3.22	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138536545	0.94769	2023-09-13 19:28:05.815077-04
938	ribbon-finance	Ribbon Finance	rbn	0.175879	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138309712	-2.76224	2023-09-13 19:28:05.816418-04
939	ocean-protocol	Ocean Protocol	ocean	0.312663	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135937489	0.80419	2023-09-13 19:28:05.817541-04
940	seth2	sETH2	seth2	1594.3	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135598350	0.67531	2023-09-13 19:28:05.818916-04
941	axelar	Axelar	axl	0.341064	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135335091	-1.63559	2023-09-13 19:28:05.820196-04
942	band-protocol	Band Protocol	band	0.995906	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133721559	1.54239	2023-09-13 19:28:05.821382-04
943	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133189307	0.01328	2023-09-13 19:28:05.822689-04
944	worldcoin-wld	Worldcoin	wld	1.015	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	132158556	-0.34777	2023-09-13 19:28:05.824493-04
945	biconomy	Biconomy	bico	0.199433	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131071969	1.06429	2023-09-13 19:28:05.826322-04
946	open-exchange-token	Open Exchange Token	ox	0.03353698	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	130684912	17.95614	2023-09-13 19:28:05.828445-04
947	iostoken	IOST	iost	0.00687796	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128817970	1.81223	2023-09-13 19:28:05.830469-04
948	kadena	Kadena	kda	0.520586	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127760378	0.69987	2023-09-13 19:28:05.832122-04
949	wax	WAX	waxp	0.0377028	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126446007	2.00646	2023-09-13 19:28:05.833962-04
950	merit-circle	Merit Circle	mc	0.263598	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121992029	-1.07452	2023-09-13 19:28:05.835312-04
951	moonbeam	Moonbeam	glmr	0.165236	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121090788	-0.5622	2023-09-13 19:28:05.836606-04
952	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.59637	2023-09-13 19:28:05.837986-04
953	ronin	Ronin	ron	0.477458	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120516198	-0.21233	2023-09-13 19:28:05.839416-04
954	tomochain	TomoChain	tomo	1.23	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119669432	1.98438	2023-09-13 19:28:05.842229-04
955	terrausd	TerraClassicUSD	ustc	0.01211259	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118617247	-0.1531	2023-09-13 19:28:05.843849-04
956	sushi	Sushi	sushi	0.612721	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118314929	5.08849	2023-09-13 19:28:05.845085-04
957	swissborg	SwissBorg	chsb	0.123169	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117191359	0.6363	2023-09-13 19:28:05.846381-04
958	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26242	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	116308956	1.23728	2023-09-13 19:28:05.847516-04
959	harmony	Harmony	one	0.00941652	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	116101527	1.71582	2023-09-13 19:28:05.849022-04
960	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1631.93	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115834430	0.89181	2023-09-13 19:28:05.850501-04
961	tribe-2	Tribe	tribe	0.250161	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	113968729	-2.24368	2023-09-13 19:28:05.85203-04
1465	magic	Magic	magic	0.466541	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110698543	6.60085	2023-09-13 19:28:33.421853-04
962	crvusd	crvUSD	crvusd	0.996719	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111455689	-0.06332	2023-09-13 19:28:05.85355-04
963	bora	BORA	bora	0.111727	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	111196157	1.65881	2023-09-13 19:28:05.854616-04
964	skale	SKALE	skl	0.02358787	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	111030371	7.43042	2023-09-13 19:28:05.855648-04
965	magic	Magic	magic	0.46702	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110698543	6.57592	2023-09-13 19:28:05.856929-04
966	polymath	Polymath	poly	0.121166	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108957350	-0.13328	2023-09-13 19:28:05.859382-04
967	ssv-network	SSV Network	ssv	15.23	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	108063383	2.32274	2023-09-13 19:28:05.861462-04
968	digibyte	DigiByte	dgb	0.00646397	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106699644	3.96265	2023-09-13 19:28:05.86361-04
969	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104453883	0.90747	2023-09-13 19:28:05.865247-04
970	hive	Hive	hive	0.277142	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102824140	2.93384	2023-09-13 19:28:05.866481-04
971	zelcash	Flux	flux	0.32273	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102660482	1.16665	2023-09-13 19:28:05.867565-04
972	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.44288	2023-09-13 19:28:05.868587-04
973	lisk	Lisk	lsk	0.705566	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	102244427	3.94936	2023-09-13 19:28:05.869601-04
974	api3	API3	api3	1.053	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	100222857	3.50403	2023-09-13 19:28:05.87068-04
975	vethor-token	VeThor	vtho	0.00147521	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99491245	45.96527	2023-09-13 19:28:05.871779-04
976	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	99074563	1.37028	2023-09-13 19:28:05.873127-04
977	zencash	Horizen	zen	7	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98815923	2.09584	2023-09-13 19:28:05.875456-04
978	echelon-prime	Echelon Prime	prime	4.23	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98291355	1.56065	2023-09-13 19:28:05.877353-04
979	msol	Marinade staked SOL	msol	20.85	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97315189	2.21997	2023-09-13 19:28:05.878816-04
980	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97012534	6.75961	2023-09-13 19:28:05.880122-04
981	metal	Metal DAO	mtl	1.49	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96999782	10.61479	2023-09-13 19:28:05.881543-04
982	amp-token	Amp	amp	0.00170691	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95857345	-0.93878	2023-09-13 19:28:05.882808-04
983	reserve-rights-token	Reserve Rights	rsr	0.00185864	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	94120099	6.60396	2023-09-13 19:28:05.883973-04
984	kyber-network-crystal	Kyber Network Crystal	knc	0.517227	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94081494	2.9944	2023-09-13 19:28:05.885087-04
985	everscale	Everscale	ever	0.051749	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93495844	-2.945	2023-09-13 19:28:05.886221-04
986	cartesi	Cartesi	ctsi	0.127115	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93303294	7.38747	2023-09-13 19:28:05.887262-04
987	stargate-finance	Stargate Finance	stg	0.451805	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92515673	-0.08328	2023-09-13 19:28:05.888258-04
988	blox	Blox	cdt	0.134487	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	0.35582	2023-09-13 19:28:05.889279-04
989	bitkub-coin	Bitkub Coin	kub	1.021	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90353025	1.0521	2023-09-13 19:28:05.891319-04
990	krypton-dao	Krypton DAO	krd	0.875592	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89694628	-3.17793	2023-09-13 19:28:05.893533-04
991	polymesh	Polymesh	polyx	0.104832	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89339319	1.80929	2023-09-13 19:28:05.894934-04
992	deso	Decentralized Social	deso	8.47	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89231880	-1.02372	2023-09-13 19:28:05.896003-04
993	nervos-network	Nervos Network	ckb	0.0026795	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89230989	2.53956	2023-09-13 19:28:05.897191-04
994	e-radix	e-Radix	exrd	0.057503	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86894757	1.06515	2023-09-13 19:28:05.898368-04
995	lukso-token	LUKSO [OLD]	lyxe	5.55	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86488041	-1.20739	2023-09-13 19:28:05.899537-04
996	stp-network	STP	stpt	0.04411352	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85689689	3.88564	2023-09-13 19:28:05.900727-04
997	status	Status	snt	0.02156446	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85389125	0.03575	2023-09-13 19:28:05.901881-04
998	pundi-x-2	Pundi X	pundix	0.324102	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83778387	2.74901	2023-09-13 19:28:05.902962-04
999	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83700197	-0.45171	2023-09-13 19:28:05.904081-04
1000	joe	JOE	joe	0.244969	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83695305	1.29835	2023-09-13 19:28:05.905152-04
1001	bitcoin	Bitcoin	btc	26229	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	511508652947	1.23594	2023-09-13 19:28:15.843534-04
1002	ethereum	Ethereum	eth	1607.79	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193431699129	0.70661	2023-09-13 19:28:15.845895-04
1003	tether	Tether	usdt	0.999721	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83008585433	-0.07522	2023-09-13 19:28:15.848425-04
1004	binancecoin	BNB	bnb	212.64	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32732050445	0.39982	2023-09-13 19:28:15.850593-04
1005	usd-coin	USD Coin	usdc	0.999191	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26205284093	-0.18243	2023-09-13 19:28:15.852398-04
1006	ripple	XRP	xrp	0.484189	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25719480828	0.75031	2023-09-13 19:28:15.854338-04
1007	staked-ether	Lido Staked Ether	steth	1606.94	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13869855299	0.72222	2023-09-13 19:28:15.85571-04
1009	dogecoin	Dogecoin	doge	0.061284	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8645966340	0.43279	2023-09-13 19:28:15.860503-04
1010	solana	Solana	sol	18.38	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7562442101	2.20014	2023-09-13 19:28:15.862236-04
1011	tron	TRON	trx	0.081096	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7233938441	0.2298	2023-09-13 19:28:15.86435-04
1012	the-open-network	Toncoin	ton	1.89	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6507989431	1.96181	2023-09-13 19:28:15.868139-04
1013	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5108572689	0.26631	2023-09-13 19:28:15.869517-04
1014	matic-network	Polygon	matic	0.513735	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4792822962	1.16725	2023-09-13 19:28:15.870758-04
1015	litecoin	Litecoin	ltc	62.02	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4573752025	3.13891	2023-09-13 19:28:15.872208-04
1016	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4280315001	1.00356	2023-09-13 19:28:15.875805-04
1017	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26245	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4276410989	1.27192	2023-09-13 19:28:15.879278-04
1018	bitcoin-cash	Bitcoin Cash	bch	200.16	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3912747710	0.538	2023-09-13 19:28:15.883967-04
1019	dai	Dai	dai	0.999213	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3837655440	0.02671	2023-09-13 19:28:15.88568-04
1020	leo-token	LEO Token	leo	3.65	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3389049069	-0.24287	2023-09-13 19:28:15.887405-04
1021	stellar	Stellar	xlm	0.120634	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3323400399	-0.57876	2023-09-13 19:28:15.889011-04
1022	avalanche-2	Avalanche	avax	9.31	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3298013800	0.91676	2023-09-13 19:28:15.890495-04
1023	chainlink	Chainlink	link	6.02	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3239487325	0.70293	2023-09-13 19:28:15.89369-04
1024	uniswap	Uniswap	uni	4.26	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3209138486	1.06232	2023-09-13 19:28:15.895781-04
1025	true-usd	TrueUSD	tusd	0.997684	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3153941157	-0.1467	2023-09-13 19:28:15.897542-04
1026	monero	Monero	xmr	143.17	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2599574805	1.54268	2023-09-13 19:28:15.898926-04
1027	okb	OKB	okb	42.09	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2526678988	1.06495	2023-09-13 19:28:15.900352-04
1028	binance-usd	Binance USD	busd	1	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2514964058	-0.09708	2023-09-13 19:28:15.901965-04
1029	ethereum-classic	Ethereum Classic	etc	15.16	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2169714696	1.12669	2023-09-13 19:28:15.90397-04
1030	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1915033609	2.47367	2023-09-13 19:28:15.906468-04
1031	hedera-hashgraph	Hedera	hbar	0.0496847	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1649487492	5.40743	2023-09-13 19:28:15.90892-04
1032	filecoin	Filecoin	fil	3.18	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1419945609	2.60628	2023-09-13 19:28:15.911491-04
1033	quant-network	Quant	qnt	92.47	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1345340384	-0.44017	2023-09-13 19:28:15.915212-04
1034	crypto-com-chain	Cronos	cro	0.050559	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326988829	0.67787	2023-09-13 19:28:15.917294-04
1035	lido-dao	Lido DAO	ldo	1.49	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1323668718	0.89098	2023-09-13 19:28:15.919176-04
1036	mantle	Mantle	mnt	0.407056	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316968665	0.01027	2023-09-13 19:28:15.921471-04
1037	internet-computer	Internet Computer	icp	2.94	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1305829926	-0.12934	2023-09-13 19:28:15.924026-04
1038	aptos	Aptos	apt	5.21	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1224900096	3.24204	2023-09-13 19:28:15.927248-04
1039	vechain	VeChain	vet	0.01657724	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1207016158	1.15752	2023-09-13 19:28:15.9294-04
1040	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1083331622	1.0069	2023-09-13 19:28:15.930895-04
1041	compound-usdt	cUSDT	cusdt	0.092038	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	1054280415	282.74774	2023-09-13 19:28:15.93224-04
1042	maker	Maker	mkr	1158.46	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1045567832	3.23014	2023-09-13 19:28:15.933546-04
1043	near	NEAR Protocol	near	1.09	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1026908329	1.92661	2023-09-13 19:28:15.934834-04
1044	kaspa	Kaspa	kas	0.0488686	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1008765581	15.19188	2023-09-13 19:28:15.936186-04
1045	arbitrum	Arbitrum	arb	0.787004	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1004615236	-0.03493	2023-09-13 19:28:15.937517-04
1046	rocket-pool-eth	Rocket Pool ETH	reth	1741.94	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	916819831	0.68609	2023-09-13 19:28:15.938829-04
1047	aave	Aave	aave	53.7	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	781218379	1.17277	2023-09-13 19:28:15.94009-04
1048	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	760759775	-0.11095	2023-09-13 19:28:15.943106-04
1049	the-graph	The Graph	grt	0.082544	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	758251771	3.78864	2023-09-13 19:28:15.945084-04
1050	usdd	USDD	usdd	0.997647	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724066930	-0.06569	2023-09-13 19:28:15.946905-04
1051	xdce-crowd-sale	XDC Network	xdc	0.052044	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	721708643	-1.43884	2023-09-13 19:28:15.948949-04
1052	algorand	Algorand	algo	0.090943	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	713405274	1.43677	2023-09-13 19:28:15.95035-04
1053	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	678457331	2.15467	2023-09-13 19:28:15.951685-04
1054	frax	Frax	frax	0.995444	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	668920257	-0.04839	2023-09-13 19:28:15.952957-04
1055	blockstack	Stacks	stx	0.459736	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	647161462	3.91621	2023-09-13 19:28:15.95423-04
1056	eos	EOS	eos	0.555405	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	622762548	1.45028	2023-09-13 19:28:15.955499-04
1057	bitget-token	Bitget Token	bgb	0.440795	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617342731	-0.29134	2023-09-13 19:28:15.956825-04
1058	elrond-erd-2	MultiversX	egld	23.5	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	610196262	2.23021	2023-09-13 19:28:15.959104-04
1059	tezos	Tezos	xtz	0.645293	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	609156601	1.60215	2023-09-13 19:28:15.961411-04
1060	the-sandbox	The Sandbox	sand	0.290856	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	600963322	2.79863	2023-09-13 19:28:15.963522-04
1061	bitcoin-cash-sv	Bitcoin SV	bsv	30.82	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	594252028	-0.82948	2023-09-13 19:28:15.965043-04
1062	theta-token	Theta Network	theta	0.592405	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	592574967	1.83328	2023-09-13 19:28:15.966407-04
1063	radix	Radix	xrd	0.057026	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	585154892	-0.03959	2023-09-13 19:28:15.967731-04
1064	injective-protocol	Injective	inj	6.92	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	579657171	1.49033	2023-09-13 19:28:15.969095-04
1065	immutable-x	ImmutableX	imx	0.494216	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	577558038	1.60481	2023-09-13 19:28:15.970317-04
1066	render-token	Render	rndr	1.53	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	568136496	1.13285	2023-09-13 19:28:15.971562-04
1067	axie-infinity	Axie Infinity	axs	4.26	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	558848271	1.65391	2023-09-13 19:28:15.973036-04
1068	fantom	Fantom	ftm	0.191822	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	538344216	2.29092	2023-09-13 19:28:15.975879-04
1069	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529443880	-0.02891	2023-09-13 19:28:15.979041-04
1070	paxos-standard	Pax Dollar	usdp	0.998772	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517780478	-0.13875	2023-09-13 19:28:15.98176-04
1071	decentraland	Decentraland	mana	0.280301	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	517269306	3.71808	2023-09-13 19:28:15.98317-04
1072	neo	NEO	neo	7.29	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	514763927	3.3987	2023-09-13 19:28:15.984464-04
1073	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	482217882	7.51197	2023-09-13 19:28:15.985764-04
1074	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:28:15.988182-04
1075	kava	Kava	kava	0.618823	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472862039	1.49485	2023-09-13 19:28:15.99007-04
1076	tether-gold	Tether Gold	xaut	1909.67	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470323530	-0.05365	2023-09-13 19:28:15.992021-04
1077	iota	IOTA	miota	0.168643	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	469306769	4.5462	2023-09-13 19:28:15.994155-04
1078	pax-gold	PAX Gold	paxg	1888.53	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	468890467	-0.23002	2023-09-13 19:28:15.997968-04
1079	rollbit-coin	Rollbit Coin	rlb	0.142079	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	468701031	-4.82892	2023-09-13 19:28:16.001348-04
1080	ecash	eCash	xec	2.297e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	448703116	1.80856	2023-09-13 19:28:16.00364-04
1081	rocket-pool	Rocket Pool	rpl	22.16	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	436596542	-0.01874	2023-09-13 19:28:16.006308-04
1082	flow	Flow	flow	0.418415	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433583748	2.50148	2023-09-13 19:28:16.0087-04
1083	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	424613667	1.28867	2023-09-13 19:28:16.011202-04
1084	frax-ether	Frax Ether	frxeth	1604.1	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	416368566	0.66941	2023-09-13 19:28:16.013039-04
1085	tokenize-xchange	Tokenize Xchange	tkx	5.18	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414466487	0.48386	2023-09-13 19:28:16.014846-04
1086	kucoin-shares	KuCoin	kcs	4.26	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	410757698	3.18357	2023-09-13 19:28:16.016716-04
1087	chiliz	Chiliz	chz	0.056506	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	394328827	1.11872	2023-09-13 19:28:16.018713-04
1088	first-digital-usd	First Digital USD	fdusd	0.998295	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393699974	-0.13214	2023-09-13 19:28:16.020698-04
1089	frax-share	Frax Share	fxs	5.33	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	392212273	4.3443	2023-09-13 19:28:16.022354-04
1090	klay-token	Klaytn	klay	0.121599	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	387895768	-1.87389	2023-09-13 19:28:16.024437-04
1091	huobi-token	Huobi	ht	2.37	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376930367	0.87241	2023-09-13 19:28:16.026286-04
1092	casper-network	Casper Network	cspr	0.03279862	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	371171346	0.37163	2023-09-13 19:28:16.028382-04
1093	bittorrent	BitTorrent	btt	3.8808e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	369265186	0.3103	2023-09-13 19:28:16.030316-04
1094	gala	GALA	gala	0.01408113	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	369134969	0.91542	2023-09-13 19:28:16.032228-04
1095	curve-dao-token	Curve DAO	crv	0.415794	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365440021	3.78614	2023-09-13 19:28:16.034016-04
1096	mina-protocol	Mina Protocol	mina	0.37591	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	364007063	1.83755	2023-09-13 19:28:16.035817-04
1097	sui	Sui	sui	0.442048	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	350478982	3.38581	2023-09-13 19:28:16.037789-04
1098	dydx	dYdX	dydx	1.94	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	340055245	2.34941	2023-09-13 19:28:16.0393-04
1099	terra-luna	Terra Luna Classic	lunc	5.798e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	338423885	1.17875	2023-09-13 19:28:16.040881-04
1558	tezos	Tezos	xtz	0.644171	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	608718029	1.36916	2023-09-13 19:35:52.998547-04
1100	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1685.67	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333466319	0.74808	2023-09-13 19:28:16.044526-04
1101	trust-wallet-token	Trust Wallet	twt	0.782477	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	326066032	0.35805	2023-09-13 19:28:16.046698-04
1102	nexo	NEXO	nexo	0.561457	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319891888	-0.68397	2023-09-13 19:28:16.049991-04
1103	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.74636	2023-09-13 19:28:16.052682-04
1104	gemini-dollar	Gemini Dollar	gusd	0.999507	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307576566	-0.00523	2023-09-13 19:28:16.055179-04
1105	apenft	APENFT	nft	3.03386e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300284558	0.6081	2023-09-13 19:28:16.05894-04
1106	dash	Dash	dash	25.65	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293930570	1.47236	2023-09-13 19:28:16.06137-04
1107	staked-frax-ether	Staked Frax Ether	sfrxeth	1696.19	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293434742	0.77508	2023-09-13 19:28:16.063395-04
1108	gmx	GMX	gmx	31.67	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285457524	0.9684	2023-09-13 19:28:16.065456-04
1109	pepe	Pepe	pepe	6.75576e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	285129139	0.50699	2023-09-13 19:28:16.067173-04
1110	liquity-usd	Liquity USD	lusd	0.996624	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282594709	0.09876	2023-09-13 19:28:16.068976-04
1111	astar	Astar	astr	0.053225	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	280253338	-5.37066	2023-09-13 19:28:16.070802-04
1112	woo-network	WOO Network	woo	0.158332	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	277406386	2.21658	2023-09-13 19:28:16.07244-04
1113	zilliqa	Zilliqa	zil	0.01611662	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	274229955	6.17364	2023-09-13 19:28:16.074602-04
1114	compound-governance-token	Compound	comp	39.59	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271804182	7.46237	2023-09-13 19:28:16.077153-04
1115	arweave	Arweave	ar	4.04	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	265473642	1.62526	2023-09-13 19:28:16.082146-04
1116	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:28:16.084172-04
1117	flare-networks	Flare	flr	0.01125331	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263878352	-3.8862	2023-09-13 19:28:16.086057-04
1118	defichain	DeFiChain	dfi	0.351248	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262383838	5.80728	2023-09-13 19:28:16.087797-04
1119	safepal	SafePal	sfp	0.615277	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	259012696	5.5586	2023-09-13 19:28:16.089627-04
1120	gnosis	Gnosis	gno	99.19	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257113535	1.03142	2023-09-13 19:28:16.091377-04
1121	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255584072	0.48728	2023-09-13 19:28:16.094297-04
1122	basic-attention-token	Basic Attention	bat	0.16683	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248684787	3.02438	2023-09-13 19:28:16.096468-04
1123	1inch	1inch	1inch	0.234556	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241668126	2.64011	2023-09-13 19:28:16.099513-04
1124	conflux-token	Conflux	cfx	0.113799	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	239033258	1.08528	2023-09-13 19:28:16.10202-04
1125	chia	Chia	xch	28.25	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238969185	2.82319	2023-09-13 19:28:16.104683-04
1126	fetch-ai	Fetch.ai	fet	0.22471	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234673710	-0.34825	2023-09-13 19:28:16.107217-04
1127	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233936659	1.33192	2023-09-13 19:28:16.109708-04
1128	illuvium	Illuvium	ilv	39.97	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	233475229	0.00089	2023-09-13 19:28:16.111873-04
1129	oec-token	OKT Chain	okt	13.07	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233255376	-0.34314	2023-09-13 19:28:16.113655-04
1130	huobi-btc	Huobi BTC	hbtc	25817	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231937090	-0.36657	2023-09-13 19:28:16.115201-04
1131	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.41004	2023-09-13 19:28:16.116886-04
1132	ecomi	ECOMI	omi	0.00084037	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227674688	0.50374	2023-09-13 19:28:16.118636-04
1133	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226894016	-2.08878	2023-09-13 19:28:16.120624-04
1134	enjincoin	Enjin Coin	enj	0.223585	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223810042	-1.7817	2023-09-13 19:28:16.121817-04
1135	singularitynet	SingularityNET	agix	0.180107	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	222204972	3.67983	2023-09-13 19:28:16.123055-04
1136	loopring	Loopring	lrc	0.177213	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220988437	1.56676	2023-09-13 19:28:16.124758-04
1137	tether-eurt	Euro Tether	eurt	1.073	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	220976083	-0.44726	2023-09-13 19:28:16.126714-04
1138	nem	NEM	xem	0.0244776	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220406982	1.64458	2023-09-13 19:28:16.12815-04
1139	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219768606	1.72508	2023-09-13 19:28:16.129213-04
1140	bitcoin-gold	Bitcoin Gold	btg	13.13	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219600449	-0.37341	2023-09-13 19:28:16.130229-04
1141	celo	Celo	celo	0.422857	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216723422	1.6546	2023-09-13 19:28:16.131244-04
1142	sei-network	Sei	sei	0.119658	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	215569226	1.12047	2023-09-13 19:28:16.132236-04
1143	zcash	Zcash	zec	25.38	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205389954	2.16767	2023-09-13 19:28:16.133801-04
1144	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	205000168	2.45685	2023-09-13 19:28:16.134932-04
1604	apenft	APENFT	nft	3.03176e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300125669	0.57608	2023-09-13 19:35:53.084008-04
1145	osmosis	Osmosis	osmo	0.325851	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200786290	0.84329	2023-09-13 19:28:16.136072-04
1146	decred	Decred	dcr	12.93	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200309596	2.79673	2023-09-13 19:28:16.137275-04
1147	helium	Helium	hnt	1.39	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	199617134	-2.21973	2023-09-13 19:28:16.138579-04
1148	oasis-network	Oasis Network	rose	0.03922575	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197403369	2.79399	2023-09-13 19:28:16.139765-04
1149	theta-fuel	Theta Fuel	tfuel	0.03076589	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193287739	2.15916	2023-09-13 19:28:16.142021-04
1150	olympus	Olympus	ohm	11.13	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192956238	-0.14587	2023-09-13 19:28:16.145249-04
1151	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192181892	1.1412	2023-09-13 19:28:16.147963-04
1152	bone-shibaswap	Bone ShibaSwap	bone	0.822468	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189138238	-1.79946	2023-09-13 19:28:16.149667-04
1153	akash-network	Akash Network	akt	0.854918	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186992316	-6.31725	2023-09-13 19:28:16.151478-04
1154	holotoken	Holo	hot	0.00105171	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186938104	0.98286	2023-09-13 19:28:16.152791-04
1155	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	186083642	1.25284	2023-09-13 19:28:16.154111-04
1156	just	JUST	jst	0.02075886	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184805642	0.74358	2023-09-13 19:28:16.155288-04
1157	aleph-zero	Aleph Zero	azero	0.765116	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184746543	-1.96113	2023-09-13 19:28:16.156436-04
1158	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:28:16.158309-04
1159	ankr	Ankr Network	ankr	0.01824572	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182767410	3.72752	2023-09-13 19:28:16.16008-04
1160	wemix-token	WEMIX	wemix	0.56044	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177687972	-0.68295	2023-09-13 19:28:16.161347-04
1161	beldex	Beldex	bdx	0.03177203	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177412592	-0.2563	2023-09-13 19:28:16.162795-04
1162	yearn-finance	yearn.finance	yfi	5313.57	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175703067	2.46765	2023-09-13 19:28:16.164279-04
1163	livepeer	Livepeer	lpt	6.03	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174954526	1.29723	2023-09-13 19:28:16.165911-04
1164	ravencoin	Ravencoin	rvn	0.0146038	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	174129000	1.03696	2023-09-13 19:28:16.167404-04
1165	stepn	STEPN	gmt	0.14546	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172920002	0.54073	2023-09-13 19:28:16.168906-04
1166	aelf	aelf	elf	0.369813	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170721029	6.20534	2023-09-13 19:28:16.1701-04
1167	alchemix-usd	Alchemix USD	alusd	0.99122	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167595098	-0.19198	2023-09-13 19:28:16.17133-04
1168	golem	Golem	glm	0.16664	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	166622042	2.70298	2023-09-13 19:28:16.172682-04
1169	jasmycoin	JasmyCoin	jasmy	0.00343683	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166600302	-0.89476	2023-09-13 19:28:16.174753-04
1170	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	166154930	-0.93588	2023-09-13 19:28:16.176174-04
1171	audius	Audius	audio	0.146373	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	163066666	1.82823	2023-09-13 19:28:16.177442-04
1172	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.09426	2023-09-13 19:28:16.178697-04
1173	kusama	Kusama	ksm	18.01	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161697638	0.94106	2023-09-13 19:28:16.1799-04
1174	blur	Blur	blur	0.173822	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	160151041	2.35221	2023-09-13 19:28:16.181059-04
1175	floki	FLOKI	floki	1.6e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	159217536	1.40535	2023-09-13 19:28:16.182431-04
1176	baby-doge-coin	Baby Doge Coin	babydoge	1.018e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	159133592	-1.87614	2023-09-13 19:28:16.183612-04
1177	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	155037222	2.15845	2023-09-13 19:28:16.184776-04
1178	icon	ICON	icx	0.159061	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	153996728	2.86591	2023-09-13 19:28:16.185908-04
1179	iotex	IoTeX	iotx	0.01575636	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148875019	2.70692	2023-09-13 19:28:16.187134-04
1180	link	FINSCHIA	fnsa	20.69	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	148133025	-0.81693	2023-09-13 19:28:16.188348-04
1181	swipe	SXP	sxp	0.254587	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146698684	3.91013	2023-09-13 19:28:16.189649-04
1182	terra-luna-2	Terra	luna	0.391254	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146420919	0.08178	2023-09-13 19:28:16.191224-04
1183	dao-maker	DAO Maker	dao	0.740676	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141531369	0.74277	2023-09-13 19:28:16.193266-04
1184	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141116008	-0.31771	2023-09-13 19:28:16.195485-04
1185	siacoin	Siacoin	sc	0.00273954	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141114911	0.98543	2023-09-13 19:28:16.19721-04
1186	ontology	Ontology	ont	0.157102	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140333376	3.08949	2023-09-13 19:28:16.198453-04
1187	balancer	Balancer	bal	3.22	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138536545	0.9547	2023-09-13 19:28:16.199742-04
1188	ribbon-finance	Ribbon Finance	rbn	0.175888	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138309712	-2.75722	2023-09-13 19:28:16.200922-04
1189	ocean-protocol	Ocean Protocol	ocean	0.312761	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135937489	0.83572	2023-09-13 19:28:16.202321-04
1190	seth2	sETH2	seth2	1594.4	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135598350	0.68186	2023-09-13 19:28:16.203627-04
1191	axelar	Axelar	axl	0.341086	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135335091	-1.62919	2023-09-13 19:28:16.204881-04
1192	band-protocol	Band Protocol	band	0.995978	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133721559	1.5498	2023-09-13 19:28:16.206233-04
1193	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133189307	0.0198	2023-09-13 19:28:16.208-04
1194	worldcoin-wld	Worldcoin	wld	1.015	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	132158556	-0.31254	2023-09-13 19:28:16.209986-04
1195	biconomy	Biconomy	bico	0.199425	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131071969	1.06054	2023-09-13 19:28:16.211864-04
1196	open-exchange-token	Open Exchange Token	ox	0.03353916	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	130684912	17.96382	2023-09-13 19:28:16.213541-04
1197	iostoken	IOST	iost	0.00687796	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128817970	1.81212	2023-09-13 19:28:16.214619-04
1198	kadena	Kadena	kda	0.520589	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127760378	0.70038	2023-09-13 19:28:16.21566-04
1199	wax	WAX	waxp	0.03770747	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126446007	2.0191	2023-09-13 19:28:16.216796-04
1200	merit-circle	Merit Circle	mc	0.263549	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121992029	-1.09278	2023-09-13 19:28:16.217976-04
1201	moonbeam	Moonbeam	glmr	0.165246	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121090788	-0.5563	2023-09-13 19:28:16.219234-04
1202	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.59637	2023-09-13 19:28:16.220482-04
1203	ronin	Ronin	ron	0.477487	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120516198	-0.20624	2023-09-13 19:28:16.22175-04
1204	tomochain	TomoChain	tomo	1.23	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119669432	1.99239	2023-09-13 19:28:16.22294-04
1205	terrausd	TerraClassicUSD	ustc	0.0121137	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118617247	-0.14397	2023-09-13 19:28:16.225017-04
1206	sushi	Sushi	sushi	0.612965	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118314929	5.13026	2023-09-13 19:28:16.226618-04
1207	swissborg	SwissBorg	chsb	0.123177	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117191359	0.6428	2023-09-13 19:28:16.228009-04
1208	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26244	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	116308956	1.24702	2023-09-13 19:28:16.229694-04
1209	harmony	Harmony	one	0.00941819	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	116101527	1.73388	2023-09-13 19:28:16.231251-04
1210	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1632.19	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115834430	0.90814	2023-09-13 19:28:16.232985-04
1211	tribe-2	Tribe	tribe	0.250177	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	113968729	-2.23731	2023-09-13 19:28:16.234486-04
1212	crvusd	crvUSD	crvusd	0.996787	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111455689	-0.05653	2023-09-13 19:28:16.236356-04
1213	bora	BORA	bora	0.111734	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	111196157	1.6652	2023-09-13 19:28:16.237503-04
1214	skale	SKALE	skl	0.02359213	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	111030371	7.44983	2023-09-13 19:28:16.238859-04
1215	magic	Magic	magic	0.467257	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110698543	6.62999	2023-09-13 19:28:16.240007-04
1216	polymath	Polymath	poly	0.121174	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108957350	-0.12678	2023-09-13 19:28:16.242351-04
1217	ssv-network	SSV Network	ssv	15.23	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	108063383	2.33604	2023-09-13 19:28:16.244234-04
1218	digibyte	DigiByte	dgb	0.00646219	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106699644	3.93395	2023-09-13 19:28:16.24577-04
1219	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104453883	0.90339	2023-09-13 19:28:16.247092-04
1220	hive	Hive	hive	0.27716	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102824140	2.94054	2023-09-13 19:28:16.248212-04
1221	zelcash	Flux	flux	0.322919	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102660482	1.226	2023-09-13 19:28:16.249548-04
1222	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.44288	2023-09-13 19:28:16.250807-04
1223	lisk	Lisk	lsk	0.705518	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	102244427	3.94218	2023-09-13 19:28:16.252081-04
1224	api3	API3	api3	1.054	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	100222857	3.53246	2023-09-13 19:28:16.253244-04
1225	vethor-token	VeThor	vtho	0.00147551	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99491245	45.99415	2023-09-13 19:28:16.254468-04
1226	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	99074563	1.39265	2023-09-13 19:28:16.255716-04
1227	zencash	Horizen	zen	7	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98815923	2.10863	2023-09-13 19:28:16.258026-04
1228	echelon-prime	Echelon Prime	prime	4.23	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98291355	1.56727	2023-09-13 19:28:16.260319-04
1229	msol	Marinade staked SOL	msol	20.85	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97315189	2.22662	2023-09-13 19:28:16.261881-04
1230	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97012534	6.77888	2023-09-13 19:28:16.263156-04
1231	metal	Metal DAO	mtl	1.5	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96999782	10.64583	2023-09-13 19:28:16.264385-04
1232	amp-token	Amp	amp	0.00170682	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95857345	-0.94405	2023-09-13 19:28:16.265851-04
1233	reserve-rights-token	Reserve Rights	rsr	0.00185877	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	94120099	6.61134	2023-09-13 19:28:16.267018-04
1234	kyber-network-crystal	Kyber Network Crystal	knc	0.517323	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94081494	3.01352	2023-09-13 19:28:16.26824-04
1235	everscale	Everscale	ever	0.051743	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93495844	-2.9551	2023-09-13 19:28:16.269342-04
1236	cartesi	Cartesi	ctsi	0.127118	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93303294	7.38986	2023-09-13 19:28:16.270382-04
1237	stargate-finance	Stargate Finance	stg	0.452495	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92515673	0.06942	2023-09-13 19:28:16.271446-04
1238	blox	Blox	cdt	0.134487	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	0.35582	2023-09-13 19:28:16.272635-04
1239	bitkub-coin	Bitkub Coin	kub	1.021	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90353025	1.0521	2023-09-13 19:28:16.274595-04
1240	krypton-dao	Krypton DAO	krd	0.875592	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89694628	-3.17793	2023-09-13 19:28:16.27691-04
1241	polymesh	Polymesh	polyx	0.104889	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89339319	1.86418	2023-09-13 19:28:16.27944-04
1242	deso	Decentralized Social	deso	8.47	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89231880	-1.0232	2023-09-13 19:28:16.280931-04
1243	nervos-network	Nervos Network	ckb	0.00267864	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89230989	2.50667	2023-09-13 19:28:16.282214-04
1244	e-radix	e-Radix	exrd	0.057507	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86894757	1.07096	2023-09-13 19:28:16.283412-04
1245	lukso-token	LUKSO [OLD]	lyxe	5.55	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86488041	-1.09396	2023-09-13 19:28:16.284623-04
1246	stp-network	STP	stpt	0.04411607	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85689689	3.89166	2023-09-13 19:28:16.285761-04
1247	status	Status	snt	0.02155689	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85389125	0.00065	2023-09-13 19:28:16.28705-04
1248	pundi-x-2	Pundi X	pundix	0.324102	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83778387	2.74913	2023-09-13 19:28:16.288272-04
1249	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83700197	-0.45171	2023-09-13 19:28:16.291446-04
1250	joe	JOE	joe	0.245002	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83695305	1.31173	2023-09-13 19:28:16.293653-04
1251	bitcoin	Bitcoin	btc	26211	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	511508652947	1.40908	2023-09-13 19:28:33.097624-04
1252	ethereum	Ethereum	eth	1605.81	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193431699129	0.74914	2023-09-13 19:28:33.099395-04
1253	tether	Tether	usdt	1	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83008585433	-0.04329	2023-09-13 19:28:33.100498-04
1254	binancecoin	BNB	bnb	212.49	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32732050445	0.33009	2023-09-13 19:28:33.101876-04
1255	usd-coin	USD Coin	usdc	0.998699	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26205284093	-0.06227	2023-09-13 19:28:33.103197-04
1256	ripple	XRP	xrp	0.483897	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25719480828	0.80624	2023-09-13 19:28:33.10438-04
1257	staked-ether	Lido Staked Ether	steth	1605.84	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13869855299	0.65322	2023-09-13 19:28:33.105596-04
1258	cardano	Cardano	ada	0.248757	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8730039032	1.11003	2023-09-13 19:28:33.107223-04
1259	dogecoin	Dogecoin	doge	0.061239	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8645966340	0.41391	2023-09-13 19:28:33.109199-04
1260	solana	Solana	sol	18.36	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7562442101	2.20458	2023-09-13 19:28:33.1107-04
1261	tron	TRON	trx	0.081027	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7233938441	0.35404	2023-09-13 19:28:33.112146-04
1262	the-open-network	Toncoin	ton	1.89	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6507989431	2.0495	2023-09-13 19:28:33.113552-04
1263	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5108572689	0.27309	2023-09-13 19:28:33.115003-04
1264	matic-network	Polygon	matic	0.513334	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4792822962	1.27254	2023-09-13 19:28:33.11621-04
1265	litecoin	Litecoin	ltc	61.97	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4573752025	3.1892	2023-09-13 19:28:33.117405-04
1266	shiba-inu	Shiba Inu	shib	7.25e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4280315001	1.09736	2023-09-13 19:28:33.118602-04
1267	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26227	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4276410989	1.38663	2023-09-13 19:28:33.119745-04
1268	bitcoin-cash	Bitcoin Cash	bch	199.91	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3912747710	0.53764	2023-09-13 19:28:33.12111-04
1269	dai	Dai	dai	0.998939	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3837655440	-0.00075	2023-09-13 19:28:33.122383-04
1270	leo-token	LEO Token	leo	3.65	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3389049069	-0.27411	2023-09-13 19:28:33.123525-04
1271	stellar	Stellar	xlm	0.120472	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3323400399	-0.6151	2023-09-13 19:28:33.125637-04
1272	avalanche-2	Avalanche	avax	9.31	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3298013800	1.0241	2023-09-13 19:28:33.12766-04
1273	chainlink	Chainlink	link	6.01	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3239487325	0.70103	2023-09-13 19:28:33.129249-04
1274	uniswap	Uniswap	uni	4.25	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3209138486	1.20586	2023-09-13 19:28:33.13097-04
1275	true-usd	TrueUSD	tusd	0.9971	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3153941157	-0.06607	2023-09-13 19:28:33.132412-04
1276	monero	Monero	xmr	143.07	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2599574805	1.60064	2023-09-13 19:28:33.133768-04
1277	okb	OKB	okb	42.06	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2526678988	1.13673	2023-09-13 19:28:33.135083-04
1278	binance-usd	Binance USD	busd	0.999727	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2514964058	-0.1526	2023-09-13 19:28:33.136161-04
1279	ethereum-classic	Ethereum Classic	etc	15.15	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2169714696	1.13611	2023-09-13 19:28:33.137267-04
1280	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1915033609	2.52894	2023-09-13 19:28:33.138281-04
1281	hedera-hashgraph	Hedera	hbar	0.04968896	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1649487492	5.41646	2023-09-13 19:28:33.139292-04
1282	filecoin	Filecoin	fil	3.17	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1419945609	2.64249	2023-09-13 19:28:33.141272-04
1283	quant-network	Quant	qnt	92.45	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1345340384	-0.29793	2023-09-13 19:28:33.143239-04
1284	crypto-com-chain	Cronos	cro	0.050492	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326988829	0.60818	2023-09-13 19:28:33.144778-04
1285	lido-dao	Lido DAO	ldo	1.48	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1323668718	1.07567	2023-09-13 19:28:33.146217-04
1286	mantle	Mantle	mnt	0.407073	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316968665	0.0144	2023-09-13 19:28:33.147463-04
1287	internet-computer	Internet Computer	icp	2.94	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1305829926	-0.26241	2023-09-13 19:28:33.148585-04
1288	aptos	Aptos	apt	5.2	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1224900096	3.17727	2023-09-13 19:28:33.149663-04
1289	vechain	VeChain	vet	0.01654438	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1207016158	1.03087	2023-09-13 19:28:33.150743-04
1290	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1083331622	1.18266	2023-09-13 19:28:33.15177-04
1291	compound-usdt	cUSDT	cusdt	0.02800299	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	1054280415	16.45331	2023-09-13 19:28:33.152857-04
1292	maker	Maker	mkr	1157.01	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1045567832	3.21619	2023-09-13 19:28:33.153999-04
1293	near	NEAR Protocol	near	1.087	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1026908329	1.79869	2023-09-13 19:28:33.155286-04
1294	kaspa	Kaspa	kas	0.04879649	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1008765581	15.06817	2023-09-13 19:28:33.15673-04
1295	arbitrum	Arbitrum	arb	0.786241	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1004615236	-0.038	2023-09-13 19:28:33.158583-04
1296	rocket-pool-eth	Rocket Pool ETH	reth	1740.84	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	916819831	0.76447	2023-09-13 19:28:33.159902-04
1297	aave	Aave	aave	53.65	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	781218379	1.15163	2023-09-13 19:28:33.161604-04
1298	whitebit	WhiteBIT Coin	wbt	5.27	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	760759775	-0.02958	2023-09-13 19:28:33.162955-04
1299	the-graph	The Graph	grt	0.08244	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	758251771	3.75601	2023-09-13 19:28:33.164417-04
1300	usdd	USDD	usdd	0.997279	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724066930	0.05538	2023-09-13 19:28:33.165757-04
1301	xdce-crowd-sale	XDC Network	xdc	0.052133	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	721708643	-1.42947	2023-09-13 19:28:33.167021-04
1302	algorand	Algorand	algo	0.090874	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	713405274	1.45323	2023-09-13 19:28:33.16833-04
1303	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	678457331	2.51163	2023-09-13 19:28:33.169759-04
1304	frax	Frax	frax	0.995535	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	668920257	0.04962	2023-09-13 19:28:33.171178-04
1305	blockstack	Stacks	stx	0.459289	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	647161462	3.99737	2023-09-13 19:28:33.172556-04
1306	eos	EOS	eos	0.554761	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	622762548	1.44647	2023-09-13 19:28:33.174377-04
1307	bitget-token	Bitget Token	bgb	0.441018	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617342731	-0.19943	2023-09-13 19:28:33.176755-04
1308	elrond-erd-2	MultiversX	egld	23.48	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	610196262	2.16695	2023-09-13 19:28:33.178695-04
1309	tezos	Tezos	xtz	0.644624	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	609156601	1.56896	2023-09-13 19:28:33.179972-04
1310	the-sandbox	The Sandbox	sand	0.290484	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	600963322	2.77363	2023-09-13 19:28:33.181122-04
1311	bitcoin-cash-sv	Bitcoin SV	bsv	30.79	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	594252028	-0.90473	2023-09-13 19:28:33.182254-04
1312	theta-token	Theta Network	theta	0.591667	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	592574967	1.66303	2023-09-13 19:28:33.183417-04
1313	radix	Radix	xrd	0.056948	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	585154892	-0.17371	2023-09-13 19:28:33.184744-04
1314	injective-protocol	Injective	inj	6.91	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	579657171	1.50006	2023-09-13 19:28:33.186019-04
1315	immutable-x	ImmutableX	imx	0.493416	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	577558038	1.42723	2023-09-13 19:28:33.187242-04
1316	render-token	Render	rndr	1.52	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	568136496	0.92975	2023-09-13 19:28:33.188334-04
1317	axie-infinity	Axie Infinity	axs	4.26	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	558848271	1.52744	2023-09-13 19:28:33.189511-04
1318	fantom	Fantom	ftm	0.191608	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	538344216	2.29572	2023-09-13 19:28:33.191717-04
1319	gatechain-token	Gate	gt	3.86	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529443880	0.04196	2023-09-13 19:28:33.1941-04
1320	paxos-standard	Pax Dollar	usdp	0.998243	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517780478	-0.12155	2023-09-13 19:28:33.19591-04
1321	decentraland	Decentraland	mana	0.279759	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	517269306	3.5173	2023-09-13 19:28:33.197586-04
1322	neo	NEO	neo	7.28	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	514763927	3.37751	2023-09-13 19:28:33.199356-04
1323	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	482217882	7.44166	2023-09-13 19:28:33.200937-04
1324	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:28:33.202493-04
1325	kava	Kava	kava	0.617972	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472862039	1.63915	2023-09-13 19:28:33.203754-04
1326	tether-gold	Tether Gold	xaut	1908.56	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470323530	-0.11188	2023-09-13 19:28:33.204905-04
1327	iota	IOTA	miota	0.168445	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	469306769	4.6101	2023-09-13 19:28:33.206158-04
1328	pax-gold	PAX Gold	paxg	1888.74	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	468890467	-0.21877	2023-09-13 19:28:33.208207-04
1329	rollbit-coin	Rollbit Coin	rlb	0.141729	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	468701031	-5.10428	2023-09-13 19:28:33.210467-04
1330	ecash	eCash	xec	2.295e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	448703116	1.66455	2023-09-13 19:28:33.212267-04
1331	rocket-pool	Rocket Pool	rpl	22.14	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	436596542	0.02861	2023-09-13 19:28:33.213736-04
1332	flow	Flow	flow	0.418106	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433583748	2.52609	2023-09-13 19:28:33.215014-04
1333	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	424613667	1.21755	2023-09-13 19:28:33.216302-04
1334	frax-ether	Frax Ether	frxeth	1603.18	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	416368566	0.7526	2023-09-13 19:28:33.217512-04
1335	tokenize-xchange	Tokenize Xchange	tkx	5.18	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414466487	0.48386	2023-09-13 19:28:33.218756-04
1336	kucoin-shares	KuCoin	kcs	4.25	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	410757698	2.65219	2023-09-13 19:28:33.22017-04
1337	chiliz	Chiliz	chz	0.056474	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	394328827	1.21392	2023-09-13 19:28:33.221334-04
1338	first-digital-usd	First Digital USD	fdusd	0.997615	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393699974	-0.02601	2023-09-13 19:28:33.222724-04
1339	frax-share	Frax Share	fxs	5.32	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	392212273	4.00984	2023-09-13 19:28:33.224805-04
1340	klay-token	Klaytn	klay	0.121201	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	387895768	-2.23724	2023-09-13 19:28:33.227178-04
1341	huobi-token	Huobi	ht	2.36	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376930367	0.82301	2023-09-13 19:28:33.2296-04
1342	casper-network	Casper Network	cspr	0.03272811	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	371171346	0.17929	2023-09-13 19:28:33.231047-04
1343	bittorrent	BitTorrent	btt	3.88127e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	369265186	0.33272	2023-09-13 19:28:33.232544-04
1344	gala	GALA	gala	0.01406148	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	369134969	1.01253	2023-09-13 19:28:33.233793-04
1345	curve-dao-token	Curve DAO	crv	0.415807	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365440021	3.68069	2023-09-13 19:28:33.234648-04
1346	mina-protocol	Mina Protocol	mina	0.37515	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	364007063	1.63166	2023-09-13 19:28:33.235796-04
1347	sui	Sui	sui	0.441036	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	350478982	3.37561	2023-09-13 19:28:33.237185-04
1348	dydx	dYdX	dydx	1.94	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	340055245	2.34173	2023-09-13 19:28:33.238474-04
1349	terra-luna	Terra Luna Classic	lunc	5.793e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	338423885	1.07952	2023-09-13 19:28:33.239796-04
1350	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1684.6	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333466319	0.84878	2023-09-13 19:28:33.241783-04
1351	trust-wallet-token	Trust Wallet	twt	0.781763	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	326066032	0.432	2023-09-13 19:28:33.243476-04
1352	nexo	NEXO	nexo	0.562056	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319891888	-0.492	2023-09-13 19:28:33.245318-04
1353	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.74636	2023-09-13 19:28:33.24829-04
1354	gemini-dollar	Gemini Dollar	gusd	0.999046	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307576566	0.09314	2023-09-13 19:28:33.250613-04
1355	apenft	APENFT	nft	3.03226e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300284558	0.55498	2023-09-13 19:28:33.252549-04
1356	dash	Dash	dash	25.62	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293930570	1.65446	2023-09-13 19:28:33.254655-04
1357	staked-frax-ether	Staked Frax Ether	sfrxeth	1695.46	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293434742	0.73158	2023-09-13 19:28:33.256168-04
1358	gmx	GMX	gmx	31.64	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285457524	0.97453	2023-09-13 19:28:33.259304-04
1359	pepe	Pepe	pepe	6.76905e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	285129139	0.92357	2023-09-13 19:28:33.262784-04
1360	liquity-usd	Liquity USD	lusd	0.996422	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282594709	0.2154	2023-09-13 19:28:33.264535-04
1361	astar	Astar	astr	0.05319	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	280253338	-5.3532	2023-09-13 19:28:33.266327-04
1362	woo-network	WOO Network	woo	0.158003	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	277406386	2.09407	2023-09-13 19:28:33.268443-04
1363	zilliqa	Zilliqa	zil	0.01609279	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	274229955	6.01662	2023-09-13 19:28:33.26987-04
1364	compound-governance-token	Compound	comp	39.57	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271804182	7.57448	2023-09-13 19:28:33.271289-04
1365	arweave	Arweave	ar	4.04	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	265473642	1.38051	2023-09-13 19:28:33.272701-04
1366	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:28:33.275065-04
1367	flare-networks	Flare	flr	0.01125845	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263878352	-3.77786	2023-09-13 19:28:33.277618-04
1368	defichain	DeFiChain	dfi	0.351235	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262383838	5.73011	2023-09-13 19:28:33.27934-04
1369	safepal	SafePal	sfp	0.614812	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	259012696	5.54881	2023-09-13 19:28:33.281506-04
1370	gnosis	Gnosis	gno	99.51	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257113535	1.50554	2023-09-13 19:28:33.283507-04
1371	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255584072	0.49855	2023-09-13 19:28:33.285219-04
1372	basic-attention-token	Basic Attention	bat	0.166759	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248684787	3.22506	2023-09-13 19:28:33.286948-04
1373	1inch	1inch	1inch	0.234388	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241668126	2.63563	2023-09-13 19:28:33.288363-04
1374	conflux-token	Conflux	cfx	0.113606	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	239033258	0.9695	2023-09-13 19:28:33.289877-04
1375	chia	Chia	xch	28.24	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238969185	2.80564	2023-09-13 19:28:33.292438-04
1376	fetch-ai	Fetch.ai	fet	0.224399	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234673710	-0.48462	2023-09-13 19:28:33.294222-04
1377	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233936659	1.24757	2023-09-13 19:28:33.296294-04
1378	illuvium	Illuvium	ilv	39.82	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	233475229	-0.4481	2023-09-13 19:28:33.297794-04
1379	oec-token	OKT Chain	okt	13.06	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233255376	-0.36209	2023-09-13 19:28:33.2991-04
1380	huobi-btc	Huobi BTC	hbtc	25812	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231937090	-0.39375	2023-09-13 19:28:33.300206-04
1381	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.34476	2023-09-13 19:28:33.301431-04
1382	ecomi	ECOMI	omi	0.00084008	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227674688	0.47387	2023-09-13 19:28:33.302794-04
1383	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226894016	-2.09946	2023-09-13 19:28:33.304047-04
1384	enjincoin	Enjin Coin	enj	0.223448	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223810042	-1.04212	2023-09-13 19:28:33.305276-04
1385	singularitynet	SingularityNET	agix	0.179744	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	222204972	3.68013	2023-09-13 19:28:33.306536-04
1386	loopring	Loopring	lrc	0.177024	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220988437	1.62914	2023-09-13 19:28:33.308446-04
1387	tether-eurt	Euro Tether	eurt	1.072	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	220976083	-0.47823	2023-09-13 19:28:33.310871-04
1388	nem	NEM	xem	0.02446072	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220406982	1.68576	2023-09-13 19:28:33.312623-04
1389	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219768606	1.68169	2023-09-13 19:28:33.313849-04
1390	bitcoin-gold	Bitcoin Gold	btg	13.15	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219600449	-0.16716	2023-09-13 19:28:33.31511-04
1391	celo	Celo	celo	0.422135	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216723422	1.57096	2023-09-13 19:28:33.316464-04
1392	sei-network	Sei	sei	0.119564	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	215569226	1.08028	2023-09-13 19:28:33.317613-04
1393	zcash	Zcash	zec	25.36	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205389954	2.15884	2023-09-13 19:28:33.318728-04
1394	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	205000168	2.40592	2023-09-13 19:28:33.319834-04
1395	osmosis	Osmosis	osmo	0.32565	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200786290	0.78134	2023-09-13 19:28:33.320972-04
1396	decred	Decred	dcr	12.93	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200309596	2.79845	2023-09-13 19:28:33.322027-04
1397	helium	Helium	hnt	1.39	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	199617134	-2.37103	2023-09-13 19:28:33.323298-04
1398	oasis-network	Oasis Network	rose	0.03919782	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197403369	2.68433	2023-09-13 19:28:33.325493-04
1399	theta-fuel	Theta Fuel	tfuel	0.03074565	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193287739	2.09195	2023-09-13 19:28:33.327007-04
1400	olympus	Olympus	ohm	11.13	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192956238	0.00272	2023-09-13 19:28:33.328897-04
1401	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192181892	1.16548	2023-09-13 19:28:33.330282-04
1402	bone-shibaswap	Bone ShibaSwap	bone	0.822655	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189138238	-1.7771	2023-09-13 19:28:33.331653-04
1403	akash-network	Akash Network	akt	0.855171	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186992316	-6.14977	2023-09-13 19:28:33.332837-04
1404	holotoken	Holo	hot	0.00105103	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186938104	1.04512	2023-09-13 19:28:33.334019-04
1405	ethereum-name-service	Ethereum Name Service	ens	7.2	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	186083642	1.33723	2023-09-13 19:28:33.335255-04
1406	just	JUST	jst	0.02075238	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184805642	0.81234	2023-09-13 19:28:33.336502-04
1407	aleph-zero	Aleph Zero	azero	0.764199	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184746543	-2.037	2023-09-13 19:28:33.33783-04
1408	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:28:33.338958-04
1409	ankr	Ankr Network	ankr	0.01822214	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182767410	3.82171	2023-09-13 19:28:33.34046-04
1410	wemix-token	WEMIX	wemix	0.559749	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177687972	-0.74499	2023-09-13 19:28:33.342726-04
1411	beldex	Beldex	bdx	0.03176551	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177412592	-0.15286	2023-09-13 19:28:33.344375-04
1412	yearn-finance	yearn.finance	yfi	5307.57	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175703067	2.42984	2023-09-13 19:28:33.345524-04
1413	livepeer	Livepeer	lpt	6.02	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174954526	1.46172	2023-09-13 19:28:33.346692-04
1414	ravencoin	Ravencoin	rvn	0.01459119	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	174129000	1.12783	2023-09-13 19:28:33.348109-04
1415	stepn	STEPN	gmt	0.145263	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172920002	0.48796	2023-09-13 19:28:33.349376-04
1416	aelf	aelf	elf	0.369928	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170721029	6.39061	2023-09-13 19:28:33.350454-04
1417	alchemix-usd	Alchemix USD	alusd	0.991259	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167595098	-0.18806	2023-09-13 19:28:33.351966-04
1418	golem	Golem	glm	0.167524	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	166622042	3.27611	2023-09-13 19:28:33.35336-04
1419	jasmycoin	JasmyCoin	jasmy	0.00343226	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166600302	-1.16637	2023-09-13 19:28:33.354918-04
1420	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	166154930	-0.77821	2023-09-13 19:28:33.356507-04
1421	audius	Audius	audio	0.146053	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	163066666	1.62102	2023-09-13 19:28:33.358541-04
1422	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.09426	2023-09-13 19:28:33.360261-04
1423	kusama	Kusama	ksm	17.99	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161697638	0.97778	2023-09-13 19:28:33.362037-04
1424	blur	Blur	blur	0.173608	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	160151041	2.40026	2023-09-13 19:28:33.363461-04
1425	floki	FLOKI	floki	1.598e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	159217536	1.50677	2023-09-13 19:28:33.364687-04
1426	baby-doge-coin	Baby Doge Coin	babydoge	1.018e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	159133592	-1.57789	2023-09-13 19:28:33.365851-04
1427	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	155037222	1.87033	2023-09-13 19:28:33.367254-04
1428	icon	ICON	icx	0.158948	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	153996728	2.82021	2023-09-13 19:28:33.368611-04
1429	iotex	IoTeX	iotx	0.01574041	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148875019	2.59859	2023-09-13 19:28:33.369812-04
1430	link	FINSCHIA	fnsa	20.68	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	148133025	-0.81886	2023-09-13 19:28:33.371009-04
1431	swipe	SXP	sxp	0.2527	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146698684	3.13993	2023-09-13 19:28:33.372334-04
1432	terra-luna-2	Terra	luna	0.390931	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146420919	-0.00737	2023-09-13 19:28:33.374433-04
1433	dao-maker	DAO Maker	dao	0.740484	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141531369	0.79836	2023-09-13 19:28:33.376346-04
1434	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141116008	-0.3575	2023-09-13 19:28:33.37799-04
1435	siacoin	Siacoin	sc	0.00273861	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141114911	0.91122	2023-09-13 19:28:33.379329-04
1436	ontology	Ontology	ont	0.156898	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140333376	3.05852	2023-09-13 19:28:33.380617-04
1437	balancer	Balancer	bal	3.22	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138536545	0.7868	2023-09-13 19:28:33.381758-04
1438	ribbon-finance	Ribbon Finance	rbn	0.17565	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138309712	-2.83804	2023-09-13 19:28:33.38286-04
1439	ocean-protocol	Ocean Protocol	ocean	0.312472	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135937489	0.80368	2023-09-13 19:28:33.38401-04
1440	seth2	sETH2	seth2	1593.41	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135598350	0.61905	2023-09-13 19:28:33.385424-04
1441	axelar	Axelar	axl	0.341037	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135335091	-1.64344	2023-09-13 19:28:33.38658-04
1442	band-protocol	Band Protocol	band	0.995691	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133721559	1.95558	2023-09-13 19:28:33.38772-04
1443	stasis-eurs	STASIS EURO	eurs	1.072	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133189307	-0.0426	2023-09-13 19:28:33.388884-04
1444	worldcoin-wld	Worldcoin	wld	1.013	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	132158556	-0.16006	2023-09-13 19:28:33.390139-04
1445	biconomy	Biconomy	bico	0.199303	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131071969	0.9986	2023-09-13 19:28:33.392509-04
1446	open-exchange-token	Open Exchange Token	ox	0.03372004	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	130684912	18.66904	2023-09-13 19:28:33.394589-04
1447	iostoken	IOST	iost	0.00687514	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128817970	1.77039	2023-09-13 19:28:33.396515-04
1448	kadena	Kadena	kda	0.519952	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127760378	0.49628	2023-09-13 19:28:33.397961-04
1449	wax	WAX	waxp	0.03769767	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126446007	2.08098	2023-09-13 19:28:33.399253-04
1450	merit-circle	Merit Circle	mc	0.262965	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121992029	-1.31213	2023-09-13 19:28:33.40064-04
1451	moonbeam	Moonbeam	glmr	0.165161	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121090788	-0.92963	2023-09-13 19:28:33.401866-04
1452	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.59637	2023-09-13 19:28:33.403123-04
1453	ronin	Ronin	ron	0.47729	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120516198	-0.13954	2023-09-13 19:28:33.404506-04
1454	tomochain	TomoChain	tomo	1.23	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119669432	1.86599	2023-09-13 19:28:33.406086-04
1455	terrausd	TerraClassicUSD	ustc	0.01210592	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118617247	-0.10695	2023-09-13 19:28:33.408061-04
1456	sushi	Sushi	sushi	0.612141	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118314929	4.98901	2023-09-13 19:28:33.410087-04
1457	swissborg	SwissBorg	chsb	0.123157	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117191359	0.69299	2023-09-13 19:28:33.411618-04
1458	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26227	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	116308956	1.34806	2023-09-13 19:28:33.413006-04
1459	harmony	Harmony	one	0.00940611	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	116101527	1.68534	2023-09-13 19:28:33.414291-04
1460	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1631.01	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115834430	0.92801	2023-09-13 19:28:33.415475-04
1461	tribe-2	Tribe	tribe	0.249933	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	113968729	-2.43023	2023-09-13 19:28:33.416582-04
1462	crvusd	crvUSD	crvusd	0.996923	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111455689	0.02995	2023-09-13 19:28:33.417794-04
1463	bora	BORA	bora	0.111764	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	111196157	1.09841	2023-09-13 19:28:33.418904-04
1464	skale	SKALE	skl	0.02357709	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	111030371	7.47877	2023-09-13 19:28:33.420351-04
1466	polymath	Polymath	poly	0.121098	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108957350	-0.01737	2023-09-13 19:28:33.423407-04
1467	ssv-network	SSV Network	ssv	15.21	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	108063383	2.16317	2023-09-13 19:28:33.426241-04
1468	digibyte	DigiByte	dgb	0.00646139	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106699644	3.83724	2023-09-13 19:28:33.428117-04
1469	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104453883	0.85384	2023-09-13 19:28:33.429857-04
1470	hive	Hive	hive	0.277091	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102824140	3.02948	2023-09-13 19:28:33.431094-04
1471	zelcash	Flux	flux	0.322246	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102660482	1.01493	2023-09-13 19:28:33.432335-04
1472	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.44288	2023-09-13 19:28:33.433589-04
1473	lisk	Lisk	lsk	0.705661	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	102244427	3.96329	2023-09-13 19:28:33.43494-04
1474	api3	API3	api3	1.052	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	100222857	3.53843	2023-09-13 19:28:33.436226-04
1475	vethor-token	VeThor	vtho	0.00147886	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99491245	46.14058	2023-09-13 19:28:33.437489-04
1476	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	99074563	1.33083	2023-09-13 19:28:33.43896-04
1477	zencash	Horizen	zen	7	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98815923	2.17242	2023-09-13 19:28:33.44061-04
1478	echelon-prime	Echelon Prime	prime	4.23	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98291355	1.68894	2023-09-13 19:28:33.44251-04
1479	msol	Marinade staked SOL	msol	20.84	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97315189	2.14774	2023-09-13 19:28:33.443937-04
1480	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97012534	6.77154	2023-09-13 19:28:33.445221-04
1481	metal	Metal DAO	mtl	1.5	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96999782	10.81451	2023-09-13 19:28:33.446445-04
1482	amp-token	Amp	amp	0.00170523	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95857345	-0.90315	2023-09-13 19:28:33.447835-04
1483	reserve-rights-token	Reserve Rights	rsr	0.00185498	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	94120099	6.49208	2023-09-13 19:28:33.449203-04
1484	kyber-network-crystal	Kyber Network Crystal	knc	0.516623	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94081494	2.86487	2023-09-13 19:28:33.450415-04
1485	everscale	Everscale	ever	0.051738	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93495844	-2.88806	2023-09-13 19:28:33.451702-04
1486	cartesi	Cartesi	ctsi	0.126934	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93303294	7.55904	2023-09-13 19:28:33.453107-04
1487	stargate-finance	Stargate Finance	stg	0.451487	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92515673	-0.15361	2023-09-13 19:28:33.454259-04
1488	blox	Blox	cdt	0.134487	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	0.35582	2023-09-13 19:28:33.455332-04
1489	bitkub-coin	Bitkub Coin	kub	1.021	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90353025	1.06841	2023-09-13 19:28:33.456619-04
1490	krypton-dao	Krypton DAO	krd	0.875592	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89694628	-3.17991	2023-09-13 19:28:33.45858-04
1491	polymesh	Polymesh	polyx	0.104747	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89339319	1.72626	2023-09-13 19:28:33.460143-04
1492	deso	Decentralized Social	deso	8.49	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89231880	-1.27099	2023-09-13 19:28:33.4614-04
1493	nervos-network	Nervos Network	ckb	0.00267671	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89230989	2.39359	2023-09-13 19:28:33.46273-04
1494	e-radix	e-Radix	exrd	0.057422	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86894757	0.92182	2023-09-13 19:28:33.463943-04
1495	lukso-token	LUKSO [OLD]	lyxe	5.57	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86488041	-0.45312	2023-09-13 19:28:33.465177-04
1496	stp-network	STP	stpt	0.04411348	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85689689	3.88556	2023-09-13 19:28:33.46625-04
1497	status	Status	snt	0.02155486	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85389125	1.52848	2023-09-13 19:28:33.467371-04
1498	pundi-x-2	Pundi X	pundix	0.323911	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83778387	2.66791	2023-09-13 19:28:33.469539-04
1499	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83700197	-0.45374	2023-09-13 19:28:33.470881-04
1500	joe	JOE	joe	0.244505	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83695305	1.10622	2023-09-13 19:28:33.47223-04
1501	bitcoin	Bitcoin	btc	26216	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	510794285088	1.28289	2023-09-13 19:35:52.905314-04
1502	ethereum	Ethereum	eth	1606.97	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193179886199	0.69574	2023-09-13 19:35:52.908509-04
1503	tether	Tether	usdt	0.999971	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83032353215	-0.0416	2023-09-13 19:35:52.910921-04
1504	binancecoin	BNB	bnb	212.58	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32702625508	0.45607	2023-09-13 19:35:52.912663-04
1505	usd-coin	USD Coin	usdc	1	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26217460340	-0.02163	2023-09-13 19:35:52.914118-04
1506	ripple	XRP	xrp	0.484178	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25696224427	0.79703	2023-09-13 19:35:52.915449-04
1507	staked-ether	Lido Staked Ether	steth	1607.13	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13866589374	0.81257	2023-09-13 19:35:52.917146-04
1508	cardano	Cardano	ada	0.24875	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8717575138	1.06128	2023-09-13 19:35:52.919294-04
1509	dogecoin	Dogecoin	doge	0.061256	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8636343453	0.48977	2023-09-13 19:35:52.920563-04
1510	solana	Solana	sol	18.37	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7549519877	2.11663	2023-09-13 19:35:52.921979-04
1511	tron	TRON	trx	0.081074	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7230952566	0.35881	2023-09-13 19:35:52.923353-04
1512	the-open-network	Toncoin	ton	1.9	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6523964902	4.14292	2023-09-13 19:35:52.925912-04
1513	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5100462135	0.14316	2023-09-13 19:35:52.928042-04
1514	matic-network	Polygon	matic	0.513819	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4787522417	1.26626	2023-09-13 19:35:52.929968-04
1515	litecoin	Litecoin	ltc	61.98	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4564833246	3.18937	2023-09-13 19:35:52.931472-04
1516	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4277195516	1.0552	2023-09-13 19:35:52.932826-04
1517	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26241	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4273031657	1.36083	2023-09-13 19:35:52.934066-04
1518	bitcoin-cash	Bitcoin Cash	bch	199.85	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3897743223	0.06736	2023-09-13 19:35:52.935479-04
1519	dai	Dai	dai	0.998815	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3836125753	0.00632	2023-09-13 19:35:52.937143-04
1520	leo-token	LEO Token	leo	3.64	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3388563371	-0.60066	2023-09-13 19:35:52.938266-04
1521	stellar	Stellar	xlm	0.120486	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3316967523	-0.62215	2023-09-13 19:35:52.939644-04
1522	avalanche-2	Avalanche	avax	9.3	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3292799785	0.84561	2023-09-13 19:35:52.941852-04
1523	chainlink	Chainlink	link	6.02	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3235966194	0.74692	2023-09-13 19:35:52.943738-04
1524	uniswap	Uniswap	uni	4.25	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3206400424	1.06067	2023-09-13 19:35:52.94509-04
1525	true-usd	TrueUSD	tusd	0.997052	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3150526214	-0.11397	2023-09-13 19:35:52.946481-04
1526	monero	Monero	xmr	143.08	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2596264211	1.55434	2023-09-13 19:35:52.947877-04
1527	okb	OKB	okb	42.08	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2524520164	1.02833	2023-09-13 19:35:52.949102-04
1528	binance-usd	Binance USD	busd	1	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515062438	-0.01466	2023-09-13 19:35:52.950257-04
1529	ethereum-classic	Ethereum Classic	etc	15.14	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2165371512	1.00328	2023-09-13 19:35:52.9518-04
1530	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1913131414	2.41195	2023-09-13 19:35:52.9534-04
1531	hedera-hashgraph	Hedera	hbar	0.04970298	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1650430331	5.62798	2023-09-13 19:35:52.955043-04
1532	filecoin	Filecoin	fil	3.17	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1418489041	2.69733	2023-09-13 19:35:52.957042-04
1533	quant-network	Quant	qnt	92.68	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1346237101	-0.13095	2023-09-13 19:35:52.959083-04
1534	crypto-com-chain	Cronos	cro	0.050523	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326768727	0.60863	2023-09-13 19:35:52.960381-04
1535	lido-dao	Lido DAO	ldo	1.48	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1320952818	1.20334	2023-09-13 19:35:52.961687-04
1536	mantle	Mantle	mnt	0.407245	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316998530	0.01391	2023-09-13 19:35:52.963043-04
1537	internet-computer	Internet Computer	icp	2.93	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1302204464	-0.27249	2023-09-13 19:35:52.964313-04
1538	aptos	Aptos	apt	5.2	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1222684515	2.95497	2023-09-13 19:35:52.965633-04
1539	vechain	VeChain	vet	0.01657541	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1204937070	1.03555	2023-09-13 19:35:52.966741-04
1540	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1081553520	1.15859	2023-09-13 19:35:52.968245-04
1541	maker	Maker	mkr	1156.36	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1042240940	3.00932	2023-09-13 19:35:52.969442-04
1542	near	NEAR Protocol	near	1.088	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1024336784	1.69742	2023-09-13 19:35:52.970787-04
1543	kaspa	Kaspa	kas	0.04902252	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1007111596	15.39125	2023-09-13 19:35:52.972149-04
1544	arbitrum	Arbitrum	arb	0.786107	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002416619	-0.25871	2023-09-13 19:35:52.973811-04
1545	rocket-pool-eth	Rocket Pool ETH	reth	1742.3	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	914993469	0.80741	2023-09-13 19:35:52.976933-04
1546	aave	Aave	aave	53.65	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	780310030	1.05948	2023-09-13 19:35:52.978653-04
1547	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	761182298	0.08865	2023-09-13 19:35:52.980148-04
1548	the-graph	The Graph	grt	0.08241	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	757544152	3.61533	2023-09-13 19:35:52.981698-04
1549	usdd	USDD	usdd	0.998927	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724218844	0.06643	2023-09-13 19:35:52.983124-04
1550	xdce-crowd-sale	XDC Network	xdc	0.052177	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	722632291	-1.29842	2023-09-13 19:35:52.984444-04
1551	algorand	Algorand	algo	0.090887	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	711535636	1.53618	2023-09-13 19:35:52.985741-04
1552	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	675226525	2.55413	2023-09-13 19:35:52.987103-04
1553	frax	Frax	frax	0.99657	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669022378	0.12126	2023-09-13 19:35:52.988758-04
1554	blockstack	Stacks	stx	0.459114	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	645624346	3.9463	2023-09-13 19:35:52.990354-04
1555	eos	EOS	eos	0.55477	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621471719	1.34683	2023-09-13 19:35:52.993497-04
1556	bitget-token	Bitget Token	bgb	0.441016	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617377868	-0.26139	2023-09-13 19:35:52.9955-04
1557	elrond-erd-2	MultiversX	egld	23.5	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	609909828	2.31995	2023-09-13 19:35:52.997087-04
1559	the-sandbox	The Sandbox	sand	0.290364	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	599858726	2.63082	2023-09-13 19:35:53.000031-04
1560	bitcoin-cash-sv	Bitcoin SV	bsv	30.82	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593379059	-1.01263	2023-09-13 19:35:53.001866-04
1561	theta-token	Theta Network	theta	0.591723	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	591674047	1.55374	2023-09-13 19:35:53.003176-04
1562	radix	Radix	xrd	0.056913	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	583106717	-0.27683	2023-09-13 19:35:53.004528-04
1563	injective-protocol	Injective	inj	6.91	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	578643103	1.44109	2023-09-13 19:35:53.005825-04
1564	immutable-x	ImmutableX	imx	0.493597	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576279209	1.50864	2023-09-13 19:35:53.007588-04
1565	render-token	Render	rndr	1.52	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	566384324	1.00795	2023-09-13 19:35:53.010018-04
1566	axie-infinity	Axie Infinity	axs	4.25	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	557937336	1.47567	2023-09-13 19:35:53.012463-04
1567	fantom	Fantom	ftm	0.191477	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	537293246	2.11468	2023-09-13 19:35:53.01529-04
1568	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529550508	-0.04641	2023-09-13 19:35:53.017498-04
1569	paxos-standard	Pax Dollar	usdp	0.99823	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517152265	-0.07392	2023-09-13 19:35:53.019554-04
1570	decentraland	Decentraland	mana	0.280027	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516065574	3.77389	2023-09-13 19:35:53.021036-04
1571	neo	NEO	neo	7.28	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	513345381	3.28751	2023-09-13 19:35:53.022553-04
1572	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	481661765	7.51444	2023-09-13 19:35:53.024878-04
1573	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:35:53.027034-04
1574	kava	Kava	kava	0.618453	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472732957	1.61981	2023-09-13 19:35:53.029325-04
1575	tether-gold	Tether Gold	xaut	1909.72	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470734170	-0.1012	2023-09-13 19:35:53.030821-04
1576	pax-gold	PAX Gold	paxg	1889.03	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	469027852	-0.21813	2023-09-13 19:35:53.032221-04
1577	iota	IOTA	miota	0.168359	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	467972757	4.44914	2023-09-13 19:35:53.033815-04
1578	rollbit-coin	Rollbit Coin	rlb	0.141763	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	467542095	-5.12576	2023-09-13 19:35:53.035385-04
1579	ecash	eCash	xec	2.291e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	447213263	1.31222	2023-09-13 19:35:53.037176-04
1580	rocket-pool	Rocket Pool	rpl	21.92	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	435497469	-1.04236	2023-09-13 19:35:53.039204-04
1581	flow	Flow	flow	0.418131	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433082851	2.43914	2023-09-13 19:35:53.0415-04
1582	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423225104	1.19928	2023-09-13 19:35:53.044149-04
1583	frax-ether	Frax Ether	frxeth	1604.42	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415636884	0.78811	2023-09-13 19:35:53.046807-04
1584	tokenize-xchange	Tokenize Xchange	tkx	5.18	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414559015	0.54809	2023-09-13 19:35:53.048518-04
1585	kucoin-shares	KuCoin	kcs	4.24	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	409928467	2.75394	2023-09-13 19:35:53.049827-04
1586	chiliz	Chiliz	chz	0.056457	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393877629	1.15087	2023-09-13 19:35:53.050888-04
1587	first-digital-usd	First Digital USD	fdusd	0.998431	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393104054	-0.00642	2023-09-13 19:35:53.052075-04
1588	frax-share	Frax Share	fxs	5.32	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	391261031	4.13951	2023-09-13 19:35:53.053301-04
1589	klay-token	Klaytn	klay	0.121182	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	386068947	-2.3484	2023-09-13 19:35:53.054489-04
1590	huobi-token	Huobi	ht	2.36	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376966402	0.72773	2023-09-13 19:35:53.055847-04
1591	casper-network	Casper Network	cspr	0.03268613	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	370094928	-0.07911	2023-09-13 19:35:53.057563-04
1592	bittorrent	BitTorrent	btt	3.87703e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368825542	0.17009	2023-09-13 19:35:53.061011-04
1593	gala	GALA	gala	0.01408338	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368665086	0.93013	2023-09-13 19:35:53.063461-04
1594	curve-dao-token	Curve DAO	crv	0.415718	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365249897	3.54272	2023-09-13 19:35:53.065868-04
1595	mina-protocol	Mina Protocol	mina	0.375133	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362975972	1.50629	2023-09-13 19:35:53.068322-04
1596	sui	Sui	sui	0.441256	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	349471306	3.34643	2023-09-13 19:35:53.070047-04
1597	dydx	dYdX	dydx	1.94	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339585779	2.34917	2023-09-13 19:35:53.071263-04
1598	terra-luna	Terra Luna Classic	lunc	5.8e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	337830346	1.14541	2023-09-13 19:35:53.072389-04
1599	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1684.95	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333299610	0.79193	2023-09-13 19:35:53.074301-04
1600	trust-wallet-token	Trust Wallet	twt	0.781934	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	325748944	0.34624	2023-09-13 19:35:53.076798-04
1601	nexo	NEXO	nexo	0.569971	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319612831	-2.03468	2023-09-13 19:35:53.079446-04
1602	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.78916	2023-09-13 19:35:53.081343-04
1603	gemini-dollar	Gemini Dollar	gusd	0.998743	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307432315	-0.00489	2023-09-13 19:35:53.082702-04
1605	dash	Dash	dash	25.6	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293192958	1.57321	2023-09-13 19:35:53.085196-04
1606	staked-frax-ether	Staked Frax Ether	sfrxeth	1696.62	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293020562	0.88816	2023-09-13 19:35:53.08632-04
1607	compound-usdt	cUSDT	cusdt	0.02501421	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	286438126	4.02416	2023-09-13 19:35:53.087455-04
1608	gmx	GMX	gmx	31.63	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285154236	0.7921	2023-09-13 19:35:53.088559-04
1609	pepe	Pepe	pepe	6.76555e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284664210	0.63482	2023-09-13 19:35:53.089681-04
1610	liquity-usd	Liquity USD	lusd	0.995661	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282623019	0.0492	2023-09-13 19:35:53.093008-04
1611	astar	Astar	astr	0.053137	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	279480293	-5.68139	2023-09-13 19:35:53.094823-04
1612	woo-network	WOO Network	woo	0.158025	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	276573736	1.93639	2023-09-13 19:35:53.09738-04
1613	zilliqa	Zilliqa	zil	0.01608416	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	273487478	5.81076	2023-09-13 19:35:53.098934-04
1614	compound-governance-token	Compound	comp	39.75	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271924857	8.0128	2023-09-13 19:35:53.100557-04
1615	arweave	Arweave	ar	4.05	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	264418384	1.66876	2023-09-13 19:35:53.101878-04
1616	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:35:53.103052-04
1617	flare-networks	Flare	flr	0.01125611	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263679373	-3.97461	2023-09-13 19:35:53.104202-04
1618	defichain	DeFiChain	dfi	0.351346	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262264593	5.84588	2023-09-13 19:35:53.105322-04
1619	safepal	SafePal	sfp	0.614334	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258541316	5.4428	2023-09-13 19:35:53.106558-04
1620	gnosis	Gnosis	gno	99.22	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257868285	1.15124	2023-09-13 19:35:53.108923-04
1621	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255166280	0.47796	2023-09-13 19:35:53.112535-04
1622	basic-attention-token	Basic Attention	bat	0.166712	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248484484	3.18642	2023-09-13 19:35:53.114748-04
1623	1inch	1inch	1inch	0.234484	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241300058	2.74201	2023-09-13 19:35:53.11635-04
1624	chia	Chia	xch	28.25	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238819815	2.79646	2023-09-13 19:35:53.118374-04
1625	conflux-token	Conflux	cfx	0.113592	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	238408851	0.81251	2023-09-13 19:35:53.120072-04
1626	fetch-ai	Fetch.ai	fet	0.224508	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234216685	-0.37444	2023-09-13 19:35:53.121651-04
1627	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233717071	1.14409	2023-09-13 19:35:53.123256-04
1628	oec-token	OKT Chain	okt	13.07	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233227160	-0.27848	2023-09-13 19:35:53.125642-04
1629	illuvium	Illuvium	ilv	39.89	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232845187	-0.30802	2023-09-13 19:35:53.12796-04
1630	huobi-btc	Huobi BTC	hbtc	25825	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231609712	-0.42732	2023-09-13 19:35:53.130226-04
1631	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.44419	2023-09-13 19:35:53.131693-04
1632	ecomi	ECOMI	omi	0.00084561	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227668840	0.96531	2023-09-13 19:35:53.132909-04
1633	tominet	tomiNet	tomi	3.05	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226963199	-1.96965	2023-09-13 19:35:53.134037-04
1634	enjincoin	Enjin Coin	enj	0.223365	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223266890	-1.23654	2023-09-13 19:35:53.135124-04
1635	singularitynet	SingularityNET	agix	0.179848	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	221706770	3.70458	2023-09-13 19:35:53.136277-04
1636	tether-eurt	Euro Tether	eurt	1.074	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221280020	-0.31901	2023-09-13 19:35:53.137386-04
1637	loopring	Loopring	lrc	0.177121	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220610818	1.56027	2023-09-13 19:35:53.138443-04
1638	nem	NEM	xem	0.024462	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220179552	1.70053	2023-09-13 19:35:53.13976-04
1639	bitcoin-gold	Bitcoin Gold	btg	12.54	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219534562	-4.47941	2023-09-13 19:35:53.143008-04
1640	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219323029	1.59418	2023-09-13 19:35:53.145212-04
1641	celo	Celo	celo	0.422271	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216378052	1.74106	2023-09-13 19:35:53.148025-04
1642	sei-network	Sei	sei	0.119319	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214756415	0.88821	2023-09-13 19:35:53.14962-04
1643	zcash	Zcash	zec	25.35	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205007304	2.08327	2023-09-13 19:35:53.150997-04
1644	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204722126	2.31794	2023-09-13 19:35:53.152268-04
1645	osmosis	Osmosis	osmo	0.325723	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200606024	0.8095	2023-09-13 19:35:53.153702-04
1646	decred	Decred	dcr	12.95	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200561191	2.73473	2023-09-13 19:35:53.155231-04
1647	helium	Helium	hnt	1.38	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	198987858	-2.88865	2023-09-13 19:35:53.156546-04
1648	oasis-network	Oasis Network	rose	0.03917395	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197019075	2.56906	2023-09-13 19:35:53.158375-04
1649	theta-fuel	Theta Fuel	tfuel	0.03077844	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193188936	1.22335	2023-09-13 19:35:53.161746-04
1650	olympus	Olympus	ohm	11.11	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192983931	-0.24281	2023-09-13 19:35:53.164361-04
1651	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192062404	1.0122	2023-09-13 19:35:53.166188-04
1652	bone-shibaswap	Bone ShibaSwap	bone	0.82366	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189294573	-1.41612	2023-09-13 19:35:53.168141-04
1653	akash-network	Akash Network	akt	0.855149	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186741022	-6.32	2023-09-13 19:35:53.170297-04
1654	holotoken	Holo	hot	0.00105132	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186607630	0.95708	2023-09-13 19:35:53.171909-04
1655	ethereum-name-service	Ethereum Name Service	ens	7.2	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	185703276	1.26695	2023-09-13 19:35:53.173204-04
1656	just	JUST	jst	0.02076335	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184804599	0.91858	2023-09-13 19:35:53.175449-04
1657	aleph-zero	Aleph Zero	azero	0.765196	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184516160	-1.93309	2023-09-13 19:35:53.178011-04
1658	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:35:53.180014-04
1659	ankr	Ankr Network	ankr	0.01822814	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182328053	3.78571	2023-09-13 19:35:53.181633-04
1660	beldex	Beldex	bdx	0.03176219	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177283882	-0.21423	2023-09-13 19:35:53.182843-04
1661	wemix-token	WEMIX	wemix	0.56023	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177169270	-0.77665	2023-09-13 19:35:53.184178-04
1662	yearn-finance	yearn.finance	yfi	5307.37	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175420294	2.35163	2023-09-13 19:35:53.185439-04
1663	livepeer	Livepeer	lpt	6.02	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174684645	1.11034	2023-09-13 19:35:53.186636-04
1664	ravencoin	Ravencoin	rvn	0.01458988	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173750113	0.98186	2023-09-13 19:35:53.187845-04
1665	stepn	STEPN	gmt	0.145229	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172543286	0.46681	2023-09-13 19:35:53.18907-04
1666	aelf	aelf	elf	0.370397	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170782529	6.59016	2023-09-13 19:35:53.19099-04
1667	golem	Golem	glm	0.166375	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	167749828	2.47799	2023-09-13 19:35:53.194605-04
1668	alchemix-usd	Alchemix USD	alusd	0.991703	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167592537	-0.14475	2023-09-13 19:35:53.196933-04
1669	jasmycoin	JasmyCoin	jasmy	0.00343628	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166375377	-1.12775	2023-09-13 19:35:53.198527-04
1670	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	165773790	-0.96307	2023-09-13 19:35:53.199707-04
1671	audius	Audius	audio	0.146145	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162750360	1.59772	2023-09-13 19:35:53.201291-04
1672	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.00486	2023-09-13 19:35:53.202808-04
1673	kusama	Kusama	ksm	17.98	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161536406	0.9074	2023-09-13 19:35:53.204485-04
1674	blur	Blur	blur	0.173573	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159728393	2.21459	2023-09-13 19:35:53.205896-04
1675	floki	FLOKI	floki	1.599e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	158978830	1.31891	2023-09-13 19:35:53.207092-04
1676	baby-doge-coin	Baby Doge Coin	babydoge	1.022e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	158701597	-1.36074	2023-09-13 19:35:53.208736-04
1677	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	154955562	1.87474	2023-09-13 19:35:53.210943-04
1678	icon	ICON	icx	0.158784	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154417921	2.77771	2023-09-13 19:35:53.213531-04
1679	link	FINSCHIA	fnsa	20.87	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	149363645	0.12596	2023-09-13 19:35:53.215731-04
1680	iotex	IoTeX	iotx	0.0157376	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148659518	2.49765	2023-09-13 19:35:53.217454-04
1681	terra-luna-2	Terra	luna	0.391065	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146146963	-0.04329	2023-09-13 19:35:53.218746-04
1682	swipe	SXP	sxp	0.252889	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146063650	3.07164	2023-09-13 19:35:53.219979-04
1683	dao-maker	DAO Maker	dao	0.741132	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141620977	0.75126	2023-09-13 19:35:53.221356-04
1684	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141120131	-0.42505	2023-09-13 19:35:53.222619-04
1685	siacoin	Siacoin	sc	0.00274012	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141031449	0.94796	2023-09-13 19:35:53.224815-04
1686	ontology	Ontology	ont	0.157048	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140196210	3.0487	2023-09-13 19:35:53.226662-04
1687	balancer	Balancer	bal	3.21	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138642503	0.39285	2023-09-13 19:35:53.227863-04
1688	ribbon-finance	Ribbon Finance	rbn	0.175947	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138326583	-3.25033	2023-09-13 19:35:53.22904-04
1689	ocean-protocol	Ocean Protocol	ocean	0.3126	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135707810	0.71738	2023-09-13 19:35:53.230144-04
1690	seth2	sETH2	seth2	1594.74	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135528961	0.79053	2023-09-13 19:35:53.231179-04
1691	axelar	Axelar	axl	0.341233	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135329896	-1.74024	2023-09-13 19:35:53.23243-04
1692	band-protocol	Band Protocol	band	0.998252	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133696207	1.88247	2023-09-13 19:35:53.233616-04
1693	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133149577	0.04041	2023-09-13 19:35:53.234884-04
1694	worldcoin-wld	Worldcoin	wld	1.012	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	131583436	-0.38176	2023-09-13 19:35:53.236035-04
1695	open-exchange-token	Open Exchange Token	ox	0.03375394	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	131511105	19.05009	2023-09-13 19:35:53.237188-04
1696	biconomy	Biconomy	bico	0.199539	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131215798	1.06545	2023-09-13 19:35:53.238448-04
1697	iostoken	IOST	iost	0.00687049	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128560963	1.59307	2023-09-13 19:35:53.239879-04
1698	kadena	Kadena	kda	0.520039	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127869920	0.8592	2023-09-13 19:35:53.242287-04
1699	wax	WAX	waxp	0.03770155	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126416637	2.03832	2023-09-13 19:35:53.244192-04
1700	merit-circle	Merit Circle	mc	0.262781	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121682317	-1.40194	2023-09-13 19:35:53.245769-04
1701	moonbeam	Moonbeam	glmr	0.165241	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121645886	-0.68831	2023-09-13 19:35:53.247152-04
1702	ronin	Ronin	ron	0.477676	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120940858	-0.103	2023-09-13 19:35:53.248577-04
1703	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.51884	2023-09-13 19:35:53.249976-04
1704	tomochain	TomoChain	tomo	1.23	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119623865	2.25733	2023-09-13 19:35:53.251286-04
1705	terrausd	TerraClassicUSD	ustc	0.01211225	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118536169	-0.03682	2023-09-13 19:35:53.252498-04
1706	sushi	Sushi	sushi	0.612352	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118033261	5.30578	2023-09-13 19:35:53.2537-04
1707	swissborg	SwissBorg	chsb	0.123139	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117194870	0.659	2023-09-13 19:35:53.25508-04
1708	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26200	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	115935871	1.10957	2023-09-13 19:35:53.256407-04
1709	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1631.69	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115753041	0.98098	2023-09-13 19:35:53.258224-04
1710	harmony	Harmony	one	0.00939712	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115631045	1.31603	2023-09-13 19:35:53.259724-04
1711	tribe-2	Tribe	tribe	0.253232	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	115182923	-1.18678	2023-09-13 19:35:53.26117-04
1712	crvusd	crvUSD	crvusd	0.99742	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111440159	0.07064	2023-09-13 19:35:53.262371-04
1713	skale	SKALE	skl	0.02359171	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110855130	7.54485	2023-09-13 19:35:53.263611-04
1714	bora	BORA	bora	0.111937	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	110452358	1.257	2023-09-13 19:35:53.264935-04
1715	magic	Magic	magic	0.466734	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110396092	6.65126	2023-09-13 19:35:53.266312-04
1716	polymath	Polymath	poly	0.120634	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108798923	-0.46217	2023-09-13 19:35:53.267608-04
1717	ssv-network	SSV Network	ssv	15.22	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	107840085	2.13973	2023-09-13 19:35:53.268988-04
1718	digibyte	DigiByte	dgb	0.00644298	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106647709	3.3711	2023-09-13 19:35:53.270386-04
1719	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104403383	0.73907	2023-09-13 19:35:53.272016-04
1720	hive	Hive	hive	0.276506	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102625908	2.74104	2023-09-13 19:35:53.273692-04
1721	zelcash	Flux	flux	0.322589	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102511016	1.22178	2023-09-13 19:35:53.27537-04
1722	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.35642	2023-09-13 19:35:53.276894-04
1723	lisk	Lisk	lsk	0.696732	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	100879686	2.58505	2023-09-13 19:35:53.278342-04
1724	vethor-token	VeThor	vtho	0.00149067	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99946114	47.46264	2023-09-13 19:35:53.279691-04
1725	api3	API3	api3	1.052	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99908262	3.43498	2023-09-13 19:35:53.280854-04
1726	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	98998008	1.42517	2023-09-13 19:35:53.282205-04
1727	zencash	Horizen	zen	7	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98821943	2.07943	2023-09-13 19:35:53.283537-04
1728	echelon-prime	Echelon Prime	prime	4.25	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98408273	2.04523	2023-09-13 19:35:53.284826-04
1729	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97220525	6.48447	2023-09-13 19:35:53.286231-04
1730	msol	Marinade staked SOL	msol	20.83	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97152743	2.21383	2023-09-13 19:35:53.287502-04
1731	metal	Metal DAO	mtl	1.48	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96754377	9.57387	2023-09-13 19:35:53.28885-04
1732	amp-token	Amp	amp	0.00170804	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95726102	-0.78843	2023-09-13 19:35:53.290414-04
1733	kyber-network-crystal	Kyber Network Crystal	knc	0.517373	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94019470	2.7243	2023-09-13 19:35:53.292046-04
1734	reserve-rights-token	Reserve Rights	rsr	0.00185377	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93806949	6.33468	2023-09-13 19:35:53.293362-04
1735	everscale	Everscale	ever	0.051768	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93380641	-3.01144	2023-09-13 19:35:53.294787-04
1736	cartesi	Cartesi	ctsi	0.126878	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93277221	7.18702	2023-09-13 19:35:53.296082-04
1737	stargate-finance	Stargate Finance	stg	0.451979	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92363689	-0.12038	2023-09-13 19:35:53.297375-04
1738	blox	Blox	cdt	0.132343	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	-15.25051	2023-09-13 19:35:53.29855-04
1739	bitkub-coin	Bitkub Coin	kub	1.016	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90384512	0.29118	2023-09-13 19:35:53.299775-04
1740	krypton-dao	Krypton DAO	krd	0.875464	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89710640	-3.19404	2023-09-13 19:35:53.301105-04
1741	deso	Decentralized Social	deso	8.49	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89499288	-1.29683	2023-09-13 19:35:53.302614-04
1742	polymesh	Polymesh	polyx	0.104779	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89196987	1.79519	2023-09-13 19:35:53.30371-04
1743	nervos-network	Nervos Network	ckb	0.00267355	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89160373	2.14204	2023-09-13 19:35:53.304799-04
1744	e-radix	e-Radix	exrd	0.057515	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86992980	1.22231	2023-09-13 19:35:53.305944-04
1745	lukso-token	LUKSO [OLD]	lyxe	5.58	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86452513	-0.72339	2023-09-13 19:35:53.307885-04
1746	stp-network	STP	stpt	0.0441064	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85670408	3.76804	2023-09-13 19:35:53.309274-04
1747	status	Status	snt	0.02157446	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85343693	1.48439	2023-09-13 19:35:53.31061-04
1748	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83715138	-0.46827	2023-09-13 19:35:53.311886-04
1749	pundi-x-2	Pundi X	pundix	0.323935	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83661144	2.58935	2023-09-13 19:35:53.313165-04
1750	joe	JOE	joe	0.244462	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83536454	1.19472	2023-09-13 19:35:53.31441-04
1751	bitcoin	Bitcoin	btc	26214	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	510794285088	1.27472	2023-09-13 19:36:55.609111-04
1752	ethereum	Ethereum	eth	1606.81	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193179886199	0.68567	2023-09-13 19:36:55.6108-04
1753	tether	Tether	usdt	0.999971	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83008585433	-0.0416	2023-09-13 19:36:55.612539-04
1754	binancecoin	BNB	bnb	212.55	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32702625508	0.44134	2023-09-13 19:36:55.614112-04
1755	usd-coin	USD Coin	usdc	1	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26205284093	-0.02706	2023-09-13 19:36:55.61568-04
1756	ripple	XRP	xrp	0.484076	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25696224427	0.84341	2023-09-13 19:36:55.617256-04
1757	staked-ether	Lido Staked Ether	steth	1607.09	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13869855299	0.87592	2023-09-13 19:36:55.618492-04
1758	cardano	Cardano	ada	0.248759	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8717575138	1.06467	2023-09-13 19:36:55.61979-04
1759	dogecoin	Dogecoin	doge	0.061253	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8636343453	0.48437	2023-09-13 19:36:55.621075-04
1760	solana	Solana	sol	18.37	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7549519877	2.12369	2023-09-13 19:36:55.622319-04
1761	tron	TRON	trx	0.081051	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7233938441	0.33016	2023-09-13 19:36:55.623839-04
1762	the-open-network	Toncoin	ton	1.9	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6507989431	4.11622	2023-09-13 19:36:55.625139-04
1763	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5100462135	0.15234	2023-09-13 19:36:55.627204-04
1764	matic-network	Polygon	matic	0.513738	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4787522417	1.25025	2023-09-13 19:36:55.628575-04
1765	litecoin	Litecoin	ltc	61.97	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4564833246	3.18363	2023-09-13 19:36:55.629807-04
1766	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4277195516	1.06768	2023-09-13 19:36:55.631295-04
1767	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26235	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4276410989	1.33798	2023-09-13 19:36:55.632546-04
1768	bitcoin-cash	Bitcoin Cash	bch	199.85	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3897743223	0.06638	2023-09-13 19:36:55.634098-04
1769	dai	Dai	dai	0.998815	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3836125753	0.00632	2023-09-13 19:36:55.635608-04
1770	leo-token	LEO Token	leo	3.65	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3388563371	-0.5158	2023-09-13 19:36:55.636994-04
1771	stellar	Stellar	xlm	0.120494	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3323400399	-0.61577	2023-09-13 19:36:55.638443-04
1772	avalanche-2	Avalanche	avax	9.31	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3292799785	0.87104	2023-09-13 19:36:55.639886-04
1773	chainlink	Chainlink	link	6.01	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3235966194	0.77597	2023-09-13 19:36:55.641704-04
1774	uniswap	Uniswap	uni	4.25	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3209138486	1.06119	2023-09-13 19:36:55.643288-04
1775	true-usd	TrueUSD	tusd	0.996964	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3153941157	-0.12284	2023-09-13 19:36:55.644727-04
1776	monero	Monero	xmr	143.09	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2596264211	1.6132	2023-09-13 19:36:55.646159-04
1777	okb	OKB	okb	42.07	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2524520164	1.01264	2023-09-13 19:36:55.647451-04
1778	binance-usd	Binance USD	busd	1	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515062438	-0.02093	2023-09-13 19:36:55.648831-04
1779	ethereum-classic	Ethereum Classic	etc	15.14	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2165371512	0.99955	2023-09-13 19:36:55.650201-04
1780	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1913131414	2.449	2023-09-13 19:36:55.651429-04
1781	hedera-hashgraph	Hedera	hbar	0.04970173	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1650430331	5.62532	2023-09-13 19:36:55.652699-04
1782	filecoin	Filecoin	fil	3.18	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1418489041	2.7201	2023-09-13 19:36:55.653837-04
1783	quant-network	Quant	qnt	92.56	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1346237101	-0.26171	2023-09-13 19:36:55.655281-04
1784	crypto-com-chain	Cronos	cro	0.050478	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326768727	0.51831	2023-09-13 19:36:55.656655-04
1785	lido-dao	Lido DAO	ldo	1.48	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1320952818	1.21807	2023-09-13 19:36:55.658338-04
1786	mantle	Mantle	mnt	0.407182	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316998530	-0.00158	2023-09-13 19:36:55.659611-04
1787	internet-computer	Internet Computer	icp	2.94	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1302204464	-0.25083	2023-09-13 19:36:55.660922-04
1788	aptos	Aptos	apt	5.2	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1222684515	2.96266	2023-09-13 19:36:55.662788-04
1789	vechain	VeChain	vet	0.01657079	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1207016158	1.00742	2023-09-13 19:36:55.664202-04
1790	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1081553520	1.14147	2023-09-13 19:36:55.665811-04
1791	maker	Maker	mkr	1156.27	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1042240940	3.0008	2023-09-13 19:36:55.667867-04
1792	near	NEAR Protocol	near	1.088	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1024336784	1.68825	2023-09-13 19:36:55.669781-04
1793	kaspa	Kaspa	kas	0.04881773	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1007111596	14.90919	2023-09-13 19:36:55.671321-04
1794	arbitrum	Arbitrum	arb	0.78623	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002416619	-0.24299	2023-09-13 19:36:55.673078-04
1795	rocket-pool-eth	Rocket Pool ETH	reth	1739.7	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	914993469	0.65673	2023-09-13 19:36:55.675133-04
1796	aave	Aave	aave	53.67	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	780310030	1.10286	2023-09-13 19:36:55.676573-04
1797	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	760759775	0.08688	2023-09-13 19:36:55.677757-04
1798	the-graph	The Graph	grt	0.082496	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	758251771	3.72245	2023-09-13 19:36:55.679005-04
1799	usdd	USDD	usdd	0.998208	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724066930	-0.00564	2023-09-13 19:36:55.680335-04
1800	xdce-crowd-sale	XDC Network	xdc	0.052127	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	721708643	-1.39288	2023-09-13 19:36:55.681784-04
1801	algorand	Algorand	algo	0.090893	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	711535636	1.54365	2023-09-13 19:36:55.683352-04
1802	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	675226525	2.58711	2023-09-13 19:36:55.68493-04
1803	frax	Frax	frax	0.996085	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669022378	0.07255	2023-09-13 19:36:55.686566-04
1804	blockstack	Stacks	stx	0.459197	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	645624346	3.96489	2023-09-13 19:36:55.687802-04
1805	eos	EOS	eos	0.554771	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621471719	1.34701	2023-09-13 19:36:55.68906-04
1806	bitget-token	Bitget Token	bgb	0.44101	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617377868	-0.26278	2023-09-13 19:36:55.690689-04
1807	elrond-erd-2	MultiversX	egld	23.5	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	609909828	2.30781	2023-09-13 19:36:55.692542-04
1808	tezos	Tezos	xtz	0.644701	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	609156601	1.45258	2023-09-13 19:36:55.693815-04
1809	the-sandbox	The Sandbox	sand	0.290498	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	600963322	2.67829	2023-09-13 19:36:55.695114-04
1810	bitcoin-cash-sv	Bitcoin SV	bsv	30.8	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593379059	-0.89384	2023-09-13 19:36:55.696577-04
1811	theta-token	Theta Network	theta	0.591674	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	592574967	1.54532	2023-09-13 19:36:55.698491-04
1812	radix	Radix	xrd	0.05688	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	583106717	-0.29306	2023-09-13 19:36:55.699734-04
1813	injective-protocol	Injective	inj	6.91	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	578643103	1.46264	2023-09-13 19:36:55.700769-04
1814	immutable-x	ImmutableX	imx	0.49356	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576279209	1.50101	2023-09-13 19:36:55.701848-04
1815	render-token	Render	rndr	1.52	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	566384324	1.0634	2023-09-13 19:36:55.702928-04
1816	axie-infinity	Axie Infinity	axs	4.26	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	557937336	1.50087	2023-09-13 19:36:55.70444-04
1817	fantom	Fantom	ftm	0.191601	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	537293246	2.29204	2023-09-13 19:36:55.705761-04
1818	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529550508	-0.04388	2023-09-13 19:36:55.706889-04
1819	paxos-standard	Pax Dollar	usdp	0.998205	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517152265	-0.07645	2023-09-13 19:36:55.708284-04
1820	decentraland	Decentraland	mana	0.28004	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516065574	3.77875	2023-09-13 19:36:55.709426-04
1821	neo	NEO	neo	7.28	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	513345381	3.27327	2023-09-13 19:36:55.710735-04
1822	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	482217882	7.57445	2023-09-13 19:36:55.712215-04
1823	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:36:55.713601-04
1824	kava	Kava	kava	0.618642	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472732957	1.65096	2023-09-13 19:36:55.714726-04
1825	tether-gold	Tether Gold	xaut	1909.48	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470323530	-0.11347	2023-09-13 19:36:55.715719-04
1826	pax-gold	PAX Gold	paxg	1888.83	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	469027852	-0.22872	2023-09-13 19:36:55.716831-04
1827	iota	IOTA	miota	0.168345	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	467972757	4.44062	2023-09-13 19:36:55.718612-04
1828	rollbit-coin	Rollbit Coin	rlb	0.141809	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	467542095	-5.09467	2023-09-13 19:36:55.720082-04
1829	ecash	eCash	xec	2.294e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	447213263	1.43148	2023-09-13 19:36:55.721515-04
1830	rocket-pool	Rocket Pool	rpl	22.11	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	435497469	-0.18647	2023-09-13 19:36:55.72286-04
1831	flow	Flow	flow	0.417959	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433082851	2.39683	2023-09-13 19:36:55.724643-04
1832	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423225104	1.21095	2023-09-13 19:36:55.726227-04
1833	frax-ether	Frax Ether	frxeth	1604.35	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415636884	0.82559	2023-09-13 19:36:55.727387-04
1834	tokenize-xchange	Tokenize Xchange	tkx	5.18	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414466487	0.48483	2023-09-13 19:36:55.728586-04
1835	kucoin-shares	KuCoin	kcs	4.24	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	409928467	2.68318	2023-09-13 19:36:55.729768-04
1836	chiliz	Chiliz	chz	0.056458	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393877629	1.15256	2023-09-13 19:36:55.73105-04
1837	first-digital-usd	First Digital USD	fdusd	0.997523	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393104054	-0.09738	2023-09-13 19:36:55.732696-04
1838	frax-share	Frax Share	fxs	5.32	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	391261031	4.14005	2023-09-13 19:36:55.733951-04
1839	klay-token	Klaytn	klay	0.121142	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	386068947	-2.38019	2023-09-13 19:36:55.735131-04
1840	huobi-token	Huobi	ht	2.36	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376966402	0.68621	2023-09-13 19:36:55.736328-04
1841	casper-network	Casper Network	cspr	0.03268854	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	370094928	-0.07177	2023-09-13 19:36:55.737434-04
1842	bittorrent	BitTorrent	btt	3.87556e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368825542	0.13212	2023-09-13 19:36:55.738804-04
1843	gala	GALA	gala	0.01408327	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368665086	0.92936	2023-09-13 19:36:55.740125-04
1844	curve-dao-token	Curve DAO	crv	0.416016	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365249897	3.61678	2023-09-13 19:36:55.741715-04
1845	mina-protocol	Mina Protocol	mina	0.375211	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362975972	1.5272	2023-09-13 19:36:55.742974-04
1846	sui	Sui	sui	0.441376	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	350478982	3.37442	2023-09-13 19:36:55.744265-04
1847	dydx	dYdX	dydx	1.94	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339585779	2.36605	2023-09-13 19:36:55.745894-04
1848	terra-luna	Terra Luna Classic	lunc	5.801e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	338423885	1.21241	2023-09-13 19:36:55.747302-04
1849	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1686.33	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333299610	0.87465	2023-09-13 19:36:55.748752-04
1850	trust-wallet-token	Trust Wallet	twt	0.781829	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	326066032	0.3327	2023-09-13 19:36:55.750128-04
1851	nexo	NEXO	nexo	0.570721	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319612831	-1.90563	2023-09-13 19:36:55.751197-04
1852	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.78916	2023-09-13 19:36:55.752386-04
1853	gemini-dollar	Gemini Dollar	gusd	0.999292	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307432315	0.05007	2023-09-13 19:36:55.753847-04
1854	apenft	APENFT	nft	3.03185e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300125669	0.60114	2023-09-13 19:36:55.754839-04
1855	staked-frax-ether	Staked Frax Ether	sfrxeth	1694.99	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293434742	0.86862	2023-09-13 19:36:55.756162-04
1856	dash	Dash	dash	25.6	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293192958	1.57083	2023-09-13 19:36:55.75769-04
1857	compound-usdt	cUSDT	cusdt	0.02500575	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	286438126	3.98898	2023-09-13 19:36:55.759102-04
1858	gmx	GMX	gmx	31.63	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285154236	0.78421	2023-09-13 19:36:55.760448-04
1859	pepe	Pepe	pepe	6.76661e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284664210	0.65053	2023-09-13 19:36:55.761796-04
1860	liquity-usd	Liquity USD	lusd	0.996625	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282623019	0.14608	2023-09-13 19:36:55.762836-04
1861	astar	Astar	astr	0.05314	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	279480293	-5.67591	2023-09-13 19:36:55.763974-04
1862	woo-network	WOO Network	woo	0.158023	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	277406386	2.10734	2023-09-13 19:36:55.765002-04
1863	zilliqa	Zilliqa	zil	0.01608396	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	274229955	5.80945	2023-09-13 19:36:55.766074-04
1864	compound-governance-token	Compound	comp	39.67	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271924857	7.80442	2023-09-13 19:36:55.767684-04
1865	arweave	Arweave	ar	4.05	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	264418384	1.62294	2023-09-13 19:36:55.768926-04
1866	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:36:55.770013-04
1867	flare-networks	Flare	flr	0.01125247	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263679373	-4.00568	2023-09-13 19:36:55.771096-04
1868	defichain	DeFiChain	dfi	0.351329	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262264593	5.84061	2023-09-13 19:36:55.772357-04
1869	safepal	SafePal	sfp	0.614356	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258541316	5.44646	2023-09-13 19:36:55.773781-04
1870	gnosis	Gnosis	gno	99.25	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257868285	1.19028	2023-09-13 19:36:55.775937-04
1871	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255166280	0.46191	2023-09-13 19:36:55.777951-04
1872	basic-attention-token	Basic Attention	bat	0.166753	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248484484	3.21191	2023-09-13 19:36:55.779614-04
1873	1inch	1inch	1inch	0.234431	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241300058	2.7189	2023-09-13 19:36:55.781633-04
1874	chia	Chia	xch	28.24	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238819815	2.82454	2023-09-13 19:36:55.783303-04
1875	conflux-token	Conflux	cfx	0.113686	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	238408851	0.89517	2023-09-13 19:36:55.784889-04
1876	fetch-ai	Fetch.ai	fet	0.224469	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234216685	-0.39166	2023-09-13 19:36:55.78642-04
1877	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233717071	1.13887	2023-09-13 19:36:55.788039-04
1878	oec-token	OKT Chain	okt	13.07	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233227160	-0.28749	2023-09-13 19:36:55.790754-04
1879	illuvium	Illuvium	ilv	39.9	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232845187	-0.2836	2023-09-13 19:36:55.79264-04
1880	huobi-btc	Huobi BTC	hbtc	25825	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231609712	-0.42767	2023-09-13 19:36:55.79432-04
1881	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.40028	2023-09-13 19:36:55.796238-04
1882	ecomi	ECOMI	omi	0.00084091	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227668840	0.40334	2023-09-13 19:36:55.797616-04
1883	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226894016	-2.02583	2023-09-13 19:36:55.799134-04
1884	enjincoin	Enjin Coin	enj	0.223288	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223266890	-1.27051	2023-09-13 19:36:55.800924-04
1885	singularitynet	SingularityNET	agix	0.179857	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	221706770	3.7095	2023-09-13 19:36:55.802286-04
1886	tether-eurt	Euro Tether	eurt	1.074	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	220976083	-0.31448	2023-09-13 19:36:55.803587-04
1887	loopring	Loopring	lrc	0.177056	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220610818	1.52343	2023-09-13 19:36:55.804899-04
1888	nem	NEM	xem	0.02446441	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220179552	1.71054	2023-09-13 19:36:55.806324-04
1889	bitcoin-gold	Bitcoin Gold	btg	12.53	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219534562	-4.55329	2023-09-13 19:36:55.808022-04
1890	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219323029	1.56552	2023-09-13 19:36:55.809841-04
1891	celo	Celo	celo	0.422784	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216378052	1.86479	2023-09-13 19:36:55.811199-04
1892	sei-network	Sei	sei	0.119309	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214756415	0.87988	2023-09-13 19:36:55.812276-04
1893	zcash	Zcash	zec	25.35	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205389954	2.08033	2023-09-13 19:36:55.813376-04
1894	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204722126	2.34264	2023-09-13 19:36:55.814412-04
1895	osmosis	Osmosis	osmo	0.325706	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200606024	0.80394	2023-09-13 19:36:55.815822-04
1896	decred	Decred	dcr	12.95	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200561191	3.01871	2023-09-13 19:36:55.817348-04
1897	helium	Helium	hnt	1.38	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	198987858	-2.80249	2023-09-13 19:36:55.818952-04
1898	oasis-network	Oasis Network	rose	0.03917384	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197019075	2.56877	2023-09-13 19:36:55.82047-04
1899	theta-fuel	Theta Fuel	tfuel	0.03077642	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193287739	2.07378	2023-09-13 19:36:55.8216-04
1900	olympus	Olympus	ohm	11.13	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192983931	-0.06896	2023-09-13 19:36:55.822756-04
1901	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192062404	1.00223	2023-09-13 19:36:55.824359-04
1902	bone-shibaswap	Bone ShibaSwap	bone	0.823501	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189294573	-1.43514	2023-09-13 19:36:55.826055-04
1903	akash-network	Akash Network	akt	0.854642	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186741022	-6.37556	2023-09-13 19:36:55.827431-04
1904	holotoken	Holo	hot	0.00105064	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186607630	0.89213	2023-09-13 19:36:55.828595-04
1905	ethereum-name-service	Ethereum Name Service	ens	7.2	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	185703276	1.26203	2023-09-13 19:36:55.829893-04
1906	just	JUST	jst	0.02076034	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184804599	0.90397	2023-09-13 19:36:55.831169-04
1907	aleph-zero	Aleph Zero	azero	0.765273	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184516160	-1.92321	2023-09-13 19:36:55.832443-04
1908	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:36:55.833746-04
1909	ankr	Ankr Network	ankr	0.01823443	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182328053	3.89172	2023-09-13 19:36:55.834886-04
1910	wemix-token	WEMIX	wemix	0.559828	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177687972	-0.84784	2023-09-13 19:36:55.836132-04
1911	beldex	Beldex	bdx	0.0317528	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177283882	-0.24375	2023-09-13 19:36:55.837412-04
1912	yearn-finance	yearn.finance	yfi	5306.13	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175703067	2.32765	2023-09-13 19:36:55.838717-04
1913	livepeer	Livepeer	lpt	6.02	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174684645	1.21524	2023-09-13 19:36:55.839891-04
1914	ravencoin	Ravencoin	rvn	0.01459111	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173750113	0.99038	2023-09-13 19:36:55.841532-04
1915	stepn	STEPN	gmt	0.145251	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172920002	0.48219	2023-09-13 19:36:55.842836-04
1916	aelf	aelf	elf	0.370216	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170782529	6.53812	2023-09-13 19:36:55.843986-04
1917	golem	Golem	glm	0.167752	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	167749828	3.32616	2023-09-13 19:36:55.845206-04
1918	alchemix-usd	Alchemix USD	alusd	0.992062	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167592537	0.00748	2023-09-13 19:36:55.846341-04
1919	jasmycoin	JasmyCoin	jasmy	0.00343598	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166375377	-1.13636	2023-09-13 19:36:55.847526-04
1920	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	165773790	-0.93707	2023-09-13 19:36:55.848845-04
1921	audius	Audius	audio	0.146192	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162750360	1.63022	2023-09-13 19:36:55.850271-04
1922	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.00486	2023-09-13 19:36:55.851772-04
1923	kusama	Kusama	ksm	17.98	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161536406	0.90591	2023-09-13 19:36:55.853135-04
1924	blur	Blur	blur	0.173555	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159728393	2.20375	2023-09-13 19:36:55.854462-04
1925	floki	FLOKI	floki	1.599e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	158978830	1.32546	2023-09-13 19:36:55.855643-04
1926	baby-doge-coin	Baby Doge Coin	babydoge	1.017e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	158701597	-1.87538	2023-09-13 19:36:55.857216-04
1927	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	155037222	1.82823	2023-09-13 19:36:55.858954-04
1928	icon	ICON	icx	0.159723	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154417921	3.38528	2023-09-13 19:36:55.860918-04
1929	link	FINSCHIA	fnsa	20.87	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	149363645	0.08606	2023-09-13 19:36:55.863572-04
1930	iotex	IoTeX	iotx	0.01574079	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148659518	2.51848	2023-09-13 19:36:55.865343-04
1931	swipe	SXP	sxp	0.252897	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146698684	3.07487	2023-09-13 19:36:55.867566-04
1932	terra-luna-2	Terra	luna	0.391052	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146420919	-0.04666	2023-09-13 19:36:55.869449-04
1933	dao-maker	DAO Maker	dao	0.74112	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141620977	0.74963	2023-09-13 19:36:55.87095-04
1934	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141120131	-0.23459	2023-09-13 19:36:55.872568-04
1935	siacoin	Siacoin	sc	0.0027397	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141031449	0.93241	2023-09-13 19:36:55.874502-04
1936	ontology	Ontology	ont	0.157068	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140196210	3.06154	2023-09-13 19:36:55.875916-04
1937	balancer	Balancer	bal	3.21	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138642503	0.39429	2023-09-13 19:36:55.877404-04
1938	ribbon-finance	Ribbon Finance	rbn	0.175868	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138326583	-3.29399	2023-09-13 19:36:55.878755-04
1939	ocean-protocol	Ocean Protocol	ocean	0.312672	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135707810	0.74028	2023-09-13 19:36:55.880191-04
1940	seth2	sETH2	seth2	1594.71	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135528961	0.86612	2023-09-13 19:36:55.88169-04
1941	axelar	Axelar	axl	0.341206	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135329896	-1.74806	2023-09-13 19:36:55.883095-04
1942	band-protocol	Band Protocol	band	0.998062	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133696207	1.86303	2023-09-13 19:36:55.884665-04
1943	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133189307	-0.0004	2023-09-13 19:36:55.88628-04
1944	worldcoin-wld	Worldcoin	wld	1.012	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	132158556	-0.31082	2023-09-13 19:36:55.88789-04
1945	open-exchange-token	Open Exchange Token	ox	0.03376941	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	131511105	19.10466	2023-09-13 19:36:55.889498-04
1946	biconomy	Biconomy	bico	0.199529	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131215798	1.08638	2023-09-13 19:36:55.891274-04
1947	iostoken	IOST	iost	0.00687152	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128560963	1.60829	2023-09-13 19:36:55.893079-04
1948	kadena	Kadena	kda	0.519901	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127869920	0.83248	2023-09-13 19:36:55.89442-04
1949	wax	WAX	waxp	0.03769137	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126446007	2.01077	2023-09-13 19:36:55.895692-04
1950	merit-circle	Merit Circle	mc	0.263039	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121682317	-1.15825	2023-09-13 19:36:55.897124-04
1951	moonbeam	Moonbeam	glmr	0.165233	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121645886	-0.69352	2023-09-13 19:36:55.898334-04
1952	ronin	Ronin	ron	0.479304	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120940858	0.2374	2023-09-13 19:36:55.899499-04
1953	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.54131	2023-09-13 19:36:55.900602-04
1954	tomochain	TomoChain	tomo	1.23	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119669432	2.20094	2023-09-13 19:36:55.901729-04
1955	terrausd	TerraClassicUSD	ustc	0.01211017	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118617247	-0.05401	2023-09-13 19:36:55.902816-04
1956	sushi	Sushi	sushi	0.61224	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118314929	5.17497	2023-09-13 19:36:55.903981-04
1957	swissborg	SwissBorg	chsb	0.123136	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117191359	0.65605	2023-09-13 19:36:55.905173-04
1958	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26199	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	115935871	1.10601	2023-09-13 19:36:55.906493-04
1959	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1631.75	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115834430	0.98466	2023-09-13 19:36:55.908008-04
1960	harmony	Harmony	one	0.00939657	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115631045	1.3102	2023-09-13 19:36:55.909758-04
1961	tribe-2	Tribe	tribe	0.253144	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	113968729	-1.17698	2023-09-13 19:36:55.911287-04
1962	crvusd	crvUSD	crvusd	0.997432	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111440159	0.07179	2023-09-13 19:36:55.912753-04
1963	skale	SKALE	skl	0.02358861	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110855130	7.5307	2023-09-13 19:36:55.914416-04
1964	bora	BORA	bora	0.111145	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	110452358	0.54051	2023-09-13 19:36:55.91576-04
1965	magic	Magic	magic	0.466542	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110396092	6.60752	2023-09-13 19:36:55.916967-04
1966	polymath	Polymath	poly	0.121122	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108798923	-0.05905	2023-09-13 19:36:55.918332-04
1967	ssv-network	SSV Network	ssv	15.22	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	108063383	2.1325	2023-09-13 19:36:55.919398-04
1968	digibyte	DigiByte	dgb	0.00646391	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106647709	3.87771	2023-09-13 19:36:55.920592-04
1969	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104403383	0.73818	2023-09-13 19:36:55.921832-04
1970	zelcash	Flux	flux	0.322512	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102660482	1.15933	2023-09-13 19:36:55.923186-04
1971	hive	Hive	hive	0.276421	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102625908	2.70948	2023-09-13 19:36:55.924578-04
1972	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.35642	2023-09-13 19:36:55.925921-04
1973	lisk	Lisk	lsk	0.696655	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	100879686	2.57377	2023-09-13 19:36:55.927288-04
1974	api3	API3	api3	1.052	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99908262	3.46815	2023-09-13 19:36:55.928513-04
1975	vethor-token	VeThor	vtho	0.00149105	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99491245	47.50007	2023-09-13 19:36:55.929766-04
1976	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	99074563	1.51643	2023-09-13 19:36:55.93107-04
1977	zencash	Horizen	zen	7	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98815923	2.0746	2023-09-13 19:36:55.932307-04
1978	echelon-prime	Echelon Prime	prime	4.24	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98408273	1.80252	2023-09-13 19:36:55.93359-04
1979	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97220525	6.58057	2023-09-13 19:36:55.934942-04
1980	msol	Marinade staked SOL	msol	20.84	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97152743	2.26511	2023-09-13 19:36:55.936337-04
1981	metal	Metal DAO	mtl	1.5	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96754377	10.72103	2023-09-13 19:36:55.937716-04
1982	amp-token	Amp	amp	0.00170747	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95726102	-0.82189	2023-09-13 19:36:55.939128-04
1983	kyber-network-crystal	Kyber Network Crystal	knc	0.51763	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94019470	2.77538	2023-09-13 19:36:55.941027-04
1984	reserve-rights-token	Reserve Rights	rsr	0.00185381	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93806949	6.33724	2023-09-13 19:36:55.94277-04
1985	everscale	Everscale	ever	0.051761	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93380641	-3.02534	2023-09-13 19:36:55.94415-04
1986	cartesi	Cartesi	ctsi	0.126802	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93277221	7.12261	2023-09-13 19:36:55.945498-04
1987	stargate-finance	Stargate Finance	stg	0.451991	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92515673	0.03976	2023-09-13 19:36:55.94692-04
1988	blox	Blox	cdt	0.134487	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	0.35582	2023-09-13 19:36:55.948779-04
1989	bitkub-coin	Bitkub Coin	kub	1.016	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90384512	0.29405	2023-09-13 19:36:55.950526-04
1990	krypton-dao	Krypton DAO	krd	0.875592	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89710640	-3.17991	2023-09-13 19:36:55.952242-04
1991	deso	Decentralized Social	deso	8.48	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89499288	-1.25716	2023-09-13 19:36:55.953851-04
1992	polymesh	Polymesh	polyx	0.104764	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89196987	1.79152	2023-09-13 19:36:55.955352-04
1993	nervos-network	Nervos Network	ckb	0.00267419	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89160373	2.16648	2023-09-13 19:36:55.956924-04
1994	e-radix	e-Radix	exrd	0.057507	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86992980	1.10124	2023-09-13 19:36:55.958857-04
1995	lukso-token	LUKSO [OLD]	lyxe	5.55	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86452513	-1.20869	2023-09-13 19:36:55.960425-04
1996	stp-network	STP	stpt	0.04410498	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85689689	3.7647	2023-09-13 19:36:55.961988-04
1997	status	Status	snt	0.0215488	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85389125	1.3637	2023-09-13 19:36:55.963562-04
1998	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83715138	-0.45374	2023-09-13 19:36:55.96481-04
1999	pundi-x-2	Pundi X	pundix	0.323731	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83661144	2.52465	2023-09-13 19:36:55.966207-04
2000	joe	JOE	joe	0.244505	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83536454	1.2122	2023-09-13 19:36:55.967375-04
2001	bitcoin	Bitcoin	btc	26217	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	510794285088	1.25404	2023-09-13 19:40:02.246052-04
2002	ethereum	Ethereum	eth	1607.28	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193179886199	0.71433	2023-09-13 19:40:02.248786-04
2003	tether	Tether	usdt	1.001	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83032353215	0.02081	2023-09-13 19:40:02.250576-04
2004	binancecoin	BNB	bnb	212.54	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32702625508	0.46939	2023-09-13 19:40:02.252056-04
2005	usd-coin	USD Coin	usdc	1	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26217460340	-0.05547	2023-09-13 19:40:02.253619-04
2006	ripple	XRP	xrp	0.484056	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25696224427	0.77046	2023-09-13 19:40:02.255124-04
2007	staked-ether	Lido Staked Ether	steth	1607.07	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13866589374	0.85718	2023-09-13 19:40:02.25685-04
2008	cardano	Cardano	ada	0.248735	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8717575138	1.05535	2023-09-13 19:40:02.260112-04
2009	dogecoin	Dogecoin	doge	0.061246	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8636343453	0.46921	2023-09-13 19:40:02.262443-04
2010	solana	Solana	sol	18.36	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7549519877	2.18227	2023-09-13 19:40:02.264534-04
2011	tron	TRON	trx	0.081098	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7230952566	0.42012	2023-09-13 19:40:02.266024-04
2012	the-open-network	Toncoin	ton	1.91	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6523964902	5.05171	2023-09-13 19:40:02.267397-04
2013	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5100462135	0.25029	2023-09-13 19:40:02.268762-04
2014	matic-network	Polygon	matic	0.513747	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4787522417	1.27732	2023-09-13 19:40:02.270112-04
2015	litecoin	Litecoin	ltc	61.98	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4564833246	3.19701	2023-09-13 19:40:02.271942-04
2016	shiba-inu	Shiba Inu	shib	7.25e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4277195516	0.91907	2023-09-13 19:40:02.273614-04
2017	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26239	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4273031657	1.37392	2023-09-13 19:40:02.27704-04
2018	bitcoin-cash	Bitcoin Cash	bch	199.81	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3897743223	0.15264	2023-09-13 19:40:02.279918-04
2019	dai	Dai	dai	0.998838	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3836125753	-0.01242	2023-09-13 19:40:02.283159-04
2020	leo-token	LEO Token	leo	3.65	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3388563371	-0.24121	2023-09-13 19:40:02.284604-04
2021	stellar	Stellar	xlm	0.1205	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3316967523	-0.77918	2023-09-13 19:40:02.285903-04
2022	avalanche-2	Avalanche	avax	9.3	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3292799785	0.81304	2023-09-13 19:40:02.287228-04
2023	chainlink	Chainlink	link	6.01	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3235966194	0.81714	2023-09-13 19:40:02.288579-04
2024	uniswap	Uniswap	uni	4.25	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3206400424	1.05796	2023-09-13 19:40:02.290229-04
2025	true-usd	TrueUSD	tusd	0.998974	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3150526214	0.11249	2023-09-13 19:40:02.293455-04
2026	monero	Monero	xmr	143.02	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2596264211	1.50413	2023-09-13 19:40:02.295715-04
2027	okb	OKB	okb	42.09	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2524520164	1.07272	2023-09-13 19:40:02.297534-04
2028	binance-usd	Binance USD	busd	1	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515062438	0.08221	2023-09-13 19:40:02.299545-04
2029	ethereum-classic	Ethereum Classic	etc	15.14	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2165371512	0.94013	2023-09-13 19:40:02.301561-04
2030	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1913131414	2.44759	2023-09-13 19:40:02.303104-04
2031	hedera-hashgraph	Hedera	hbar	0.04969143	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1650430331	5.79516	2023-09-13 19:40:02.304433-04
2032	filecoin	Filecoin	fil	3.17	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1418489041	2.71415	2023-09-13 19:40:02.305762-04
2033	quant-network	Quant	qnt	92.73	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1346237101	-0.10745	2023-09-13 19:40:02.307556-04
2034	crypto-com-chain	Cronos	cro	0.050497	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326768727	0.59142	2023-09-13 19:40:02.309337-04
2035	lido-dao	Lido DAO	ldo	1.48	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1320952818	1.30363	2023-09-13 19:40:02.31185-04
2036	mantle	Mantle	mnt	0.407295	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316998530	-0.01386	2023-09-13 19:40:02.313149-04
2037	internet-computer	Internet Computer	icp	2.93	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1302204464	-0.24834	2023-09-13 19:40:02.314559-04
2038	aptos	Aptos	apt	5.2	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1222684515	2.91575	2023-09-13 19:40:02.31598-04
2039	vechain	VeChain	vet	0.016591	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1204937070	0.943	2023-09-13 19:40:02.31746-04
2040	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1081553520	1.02582	2023-09-13 19:40:02.318813-04
2041	maker	Maker	mkr	1156.37	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1042240940	3.05097	2023-09-13 19:40:02.320042-04
2042	near	NEAR Protocol	near	1.088	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1024336784	1.74799	2023-09-13 19:40:02.32127-04
2043	kaspa	Kaspa	kas	0.04948385	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1007111596	16.46904	2023-09-13 19:40:02.322558-04
2044	arbitrum	Arbitrum	arb	0.78634	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002416619	-0.11074	2023-09-13 19:40:02.325009-04
2045	rocket-pool-eth	Rocket Pool ETH	reth	1742.22	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	914993469	0.73215	2023-09-13 19:40:02.327177-04
2046	aave	Aave	aave	53.65	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	780310030	1.08644	2023-09-13 19:40:02.3293-04
2047	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	761182298	0.01359	2023-09-13 19:40:02.33119-04
2048	the-graph	The Graph	grt	0.082427	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	757544152	3.64959	2023-09-13 19:40:02.332559-04
2049	usdd	USDD	usdd	0.998685	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724218844	0.06722	2023-09-13 19:40:02.333863-04
2050	xdce-crowd-sale	XDC Network	xdc	0.052172	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	722632291	-1.18502	2023-09-13 19:40:02.33504-04
2051	algorand	Algorand	algo	0.090883	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	711535636	1.48877	2023-09-13 19:40:02.336387-04
2052	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	675226525	2.60585	2023-09-13 19:40:02.337543-04
2053	frax	Frax	frax	0.995052	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669022378	0.00079	2023-09-13 19:40:02.338859-04
2054	blockstack	Stacks	stx	0.458718	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	645624346	3.86217	2023-09-13 19:40:02.341077-04
2055	eos	EOS	eos	0.554807	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621471719	1.2908	2023-09-13 19:40:02.343047-04
2056	bitget-token	Bitget Token	bgb	0.441053	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617377868	0.02114	2023-09-13 19:40:02.34439-04
2057	elrond-erd-2	MultiversX	egld	23.51	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	609909828	2.58457	2023-09-13 19:40:02.345733-04
2058	tezos	Tezos	xtz	0.644392	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	608718029	1.38049	2023-09-13 19:40:02.347072-04
2059	the-sandbox	The Sandbox	sand	0.290172	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	599858726	2.57473	2023-09-13 19:40:02.34825-04
2060	bitcoin-cash-sv	Bitcoin SV	bsv	30.81	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593379059	-0.56204	2023-09-13 19:40:02.349541-04
2061	theta-token	Theta Network	theta	0.591406	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	591674047	1.61181	2023-09-13 19:40:02.351097-04
2062	radix	Radix	xrd	0.05683	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	583106717	-0.35546	2023-09-13 19:40:02.352634-04
2063	injective-protocol	Injective	inj	6.91	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	578643103	1.49677	2023-09-13 19:40:02.354107-04
2064	immutable-x	ImmutableX	imx	0.492912	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576279209	1.52624	2023-09-13 19:40:02.355649-04
2065	render-token	Render	rndr	1.52	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	566384324	1.0094	2023-09-13 19:40:02.357052-04
2066	axie-infinity	Axie Infinity	axs	4.25	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	557937336	1.43012	2023-09-13 19:40:02.359602-04
2067	fantom	Fantom	ftm	0.191492	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	537293246	2.24446	2023-09-13 19:40:02.361214-04
2068	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529550508	-0.0515	2023-09-13 19:40:02.362722-04
2069	paxos-standard	Pax Dollar	usdp	0.99954	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517152265	-0.02857	2023-09-13 19:40:02.363754-04
2070	decentraland	Decentraland	mana	0.279879	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516065574	3.73437	2023-09-13 19:40:02.364764-04
2071	neo	NEO	neo	7.28	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	513345381	3.21727	2023-09-13 19:40:02.365761-04
2072	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	481661765	7.56594	2023-09-13 19:40:02.366915-04
2073	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:40:02.368232-04
2074	kava	Kava	kava	0.618297	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472732957	1.66875	2023-09-13 19:40:02.369578-04
2075	tether-gold	Tether Gold	xaut	1910.27	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470734170	-0.06822	2023-09-13 19:40:02.370642-04
2076	pax-gold	PAX Gold	paxg	1888.85	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	469027852	-0.12222	2023-09-13 19:40:02.371809-04
2077	iota	IOTA	miota	0.168398	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	467972757	4.44745	2023-09-13 19:40:02.372857-04
2078	rollbit-coin	Rollbit Coin	rlb	0.141762	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	467542095	-4.63378	2023-09-13 19:40:02.374754-04
2079	ecash	eCash	xec	2.305e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	447213263	2.06989	2023-09-13 19:40:02.378295-04
2080	rocket-pool	Rocket Pool	rpl	21.9	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	435497469	-0.87661	2023-09-13 19:40:02.380225-04
2081	flow	Flow	flow	0.417885	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433082851	2.35172	2023-09-13 19:40:02.381768-04
2082	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423225104	1.38129	2023-09-13 19:40:02.384026-04
2083	frax-ether	Frax Ether	frxeth	1604.43	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415636884	0.81085	2023-09-13 19:40:02.385471-04
2084	tokenize-xchange	Tokenize Xchange	tkx	5.18	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414559015	0.54809	2023-09-13 19:40:02.38676-04
2085	kucoin-shares	KuCoin	kcs	4.24	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	409928467	2.38098	2023-09-13 19:40:02.387997-04
2086	chiliz	Chiliz	chz	0.056407	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393877629	1.09688	2023-09-13 19:40:02.389284-04
2087	first-digital-usd	First Digital USD	fdusd	0.998374	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393104054	-0.26041	2023-09-13 19:40:02.391307-04
2088	frax-share	Frax Share	fxs	5.32	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	391261031	4.11684	2023-09-13 19:40:02.393655-04
2089	klay-token	Klaytn	klay	0.121197	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	386068947	-2.05147	2023-09-13 19:40:02.395138-04
2090	huobi-token	Huobi	ht	2.37	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376966402	0.87573	2023-09-13 19:40:02.396559-04
2091	casper-network	Casper Network	cspr	0.03268536	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	370094928	0.09889	2023-09-13 19:40:02.397618-04
2092	bittorrent	BitTorrent	btt	3.87732e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368825542	0.32132	2023-09-13 19:40:02.398759-04
2093	gala	GALA	gala	0.01409124	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368665086	1.21479	2023-09-13 19:40:02.399891-04
2094	curve-dao-token	Curve DAO	crv	0.416097	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365249897	3.69923	2023-09-13 19:40:02.401043-04
2095	mina-protocol	Mina Protocol	mina	0.374713	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362975972	1.61166	2023-09-13 19:40:02.402165-04
2096	sui	Sui	sui	0.441391	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	349471306	3.15243	2023-09-13 19:40:02.403423-04
2097	dydx	dYdX	dydx	1.93	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339585779	2.28443	2023-09-13 19:40:02.404604-04
2098	terra-luna	Terra Luna Classic	lunc	5.795e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	337830346	1.17177	2023-09-13 19:40:02.405773-04
2099	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1684.88	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333299610	0.81444	2023-09-13 19:40:02.407308-04
2100	trust-wallet-token	Trust Wallet	twt	0.782091	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	325748944	0.39861	2023-09-13 19:40:02.410601-04
2101	nexo	NEXO	nexo	0.5614	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319612831	-3.28457	2023-09-13 19:40:02.413534-04
2102	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.78916	2023-09-13 19:40:02.415667-04
2103	gemini-dollar	Gemini Dollar	gusd	0.998784	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307432315	0.05749	2023-09-13 19:40:02.417186-04
2104	apenft	APENFT	nft	3.03152e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300125669	0.57735	2023-09-13 19:40:02.418546-04
2105	dash	Dash	dash	25.59	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293192958	1.0157	2023-09-13 19:40:02.419872-04
2106	staked-frax-ether	Staked Frax Ether	sfrxeth	1696.52	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293020562	0.9232	2023-09-13 19:40:02.421116-04
2107	compound-usdt	cUSDT	cusdt	0.02700283	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	286438126	12.29404	2023-09-13 19:40:02.422543-04
2108	gmx	GMX	gmx	31.64	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285154236	0.75084	2023-09-13 19:40:02.424294-04
2109	pepe	Pepe	pepe	6.75985e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284664210	0.12714	2023-09-13 19:40:02.427278-04
2110	liquity-usd	Liquity USD	lusd	0.995798	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282623019	0.03562	2023-09-13 19:40:02.430099-04
2111	astar	Astar	astr	0.053121	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	279480293	-5.64463	2023-09-13 19:40:02.432656-04
2112	woo-network	WOO Network	woo	0.157875	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	276573736	1.91926	2023-09-13 19:40:02.435104-04
2113	zilliqa	Zilliqa	zil	0.01605968	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	273487478	5.78838	2023-09-13 19:40:02.436536-04
2114	compound-governance-token	Compound	comp	39.78	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271924857	8.11203	2023-09-13 19:40:02.437981-04
2115	arweave	Arweave	ar	4.05	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	264418384	1.92872	2023-09-13 19:40:02.439171-04
2116	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:40:02.440834-04
2117	flare-networks	Flare	flr	0.01125353	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263679373	-3.98538	2023-09-13 19:40:02.443229-04
2118	defichain	DeFiChain	dfi	0.351448	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262264593	5.86807	2023-09-13 19:40:02.444675-04
2119	safepal	SafePal	sfp	0.614434	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258541316	5.37697	2023-09-13 19:40:02.446163-04
2120	gnosis	Gnosis	gno	99.51	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257868285	1.4937	2023-09-13 19:40:02.447408-04
2121	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255166280	0.49097	2023-09-13 19:40:02.449763-04
2122	basic-attention-token	Basic Attention	bat	0.166778	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248484484	3.21525	2023-09-13 19:40:02.45089-04
2123	1inch	1inch	1inch	0.234572	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241300058	2.86033	2023-09-13 19:40:02.452045-04
2124	chia	Chia	xch	28.27	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238819815	2.86893	2023-09-13 19:40:02.453373-04
2125	conflux-token	Conflux	cfx	0.113476	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	238408851	0.70471	2023-09-13 19:40:02.454491-04
2126	fetch-ai	Fetch.ai	fet	0.224111	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234216685	-0.48022	2023-09-13 19:40:02.455662-04
2127	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233717071	1.1855	2023-09-13 19:40:02.457372-04
2128	oec-token	OKT Chain	okt	13.06	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233227160	-0.34706	2023-09-13 19:40:02.460695-04
2129	illuvium	Illuvium	ilv	39.91	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232845187	-0.27664	2023-09-13 19:40:02.462939-04
2130	huobi-btc	Huobi BTC	hbtc	25791	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231609712	-0.66142	2023-09-13 19:40:02.465084-04
2131	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.41967	2023-09-13 19:40:02.466494-04
2132	ecomi	ECOMI	omi	0.00084405	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227668840	0.76006	2023-09-13 19:40:02.467977-04
2133	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226963199	-2.09645	2023-09-13 19:40:02.46926-04
2134	enjincoin	Enjin Coin	enj	0.223528	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223266890	-1.21341	2023-09-13 19:40:02.470588-04
2135	singularitynet	SingularityNET	agix	0.179869	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	221706770	3.6229	2023-09-13 19:40:02.47193-04
2136	tether-eurt	Euro Tether	eurt	1.073	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221280020	-0.33823	2023-09-13 19:40:02.473677-04
2137	loopring	Loopring	lrc	0.176805	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220610818	1.35452	2023-09-13 19:40:02.476492-04
2138	nem	NEM	xem	0.02444013	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220179552	1.71933	2023-09-13 19:40:02.480055-04
2139	bitcoin-gold	Bitcoin Gold	btg	12.96	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219534562	-1.29579	2023-09-13 19:40:02.482432-04
2140	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219323029	1.58328	2023-09-13 19:40:02.484298-04
2141	celo	Celo	celo	0.422226	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216378052	1.78821	2023-09-13 19:40:02.48648-04
2142	sei-network	Sei	sei	0.119271	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214756415	0.9121	2023-09-13 19:40:02.487985-04
2143	zcash	Zcash	zec	25.34	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205007304	2.08307	2023-09-13 19:40:02.489459-04
2144	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204722126	2.28766	2023-09-13 19:40:02.491485-04
2145	osmosis	Osmosis	osmo	0.325861	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200606024	0.79209	2023-09-13 19:40:02.493485-04
2146	decred	Decred	dcr	12.95	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200561191	2.7329	2023-09-13 19:40:02.495065-04
2147	helium	Helium	hnt	1.38	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	198987858	-2.6459	2023-09-13 19:40:02.496493-04
2148	oasis-network	Oasis Network	rose	0.03917976	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197019075	2.69062	2023-09-13 19:40:02.497705-04
2149	theta-fuel	Theta Fuel	tfuel	0.03075381	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193188936	2.00733	2023-09-13 19:40:02.498979-04
2150	olympus	Olympus	ohm	11.11	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192983931	-0.29042	2023-09-13 19:40:02.500291-04
2151	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192062404	1.08327	2023-09-13 19:40:02.501587-04
2152	bone-shibaswap	Bone ShibaSwap	bone	0.823014	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189294573	-1.41075	2023-09-13 19:40:02.502722-04
2153	akash-network	Akash Network	akt	0.854228	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186741022	-6.47797	2023-09-13 19:40:02.503993-04
2154	holotoken	Holo	hot	0.00105065	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186607630	0.85629	2023-09-13 19:40:02.505213-04
2155	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	185703276	1.20125	2023-09-13 19:40:02.506878-04
2156	just	JUST	jst	0.02079125	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184804599	1.97564	2023-09-13 19:40:02.509517-04
2157	aleph-zero	Aleph Zero	azero	0.764207	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184516160	-2.04726	2023-09-13 19:40:02.51139-04
2158	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:40:02.513071-04
2159	ankr	Ankr Network	ankr	0.01822623	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182328053	3.96223	2023-09-13 19:40:02.51441-04
2160	beldex	Beldex	bdx	0.03175655	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177283882	-0.21603	2023-09-13 19:40:02.515656-04
2161	wemix-token	WEMIX	wemix	0.559905	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177169270	-0.76965	2023-09-13 19:40:02.51696-04
2162	yearn-finance	yearn.finance	yfi	5303.26	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175420294	2.16616	2023-09-13 19:40:02.518384-04
2163	livepeer	Livepeer	lpt	6	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174684645	0.72093	2023-09-13 19:40:02.519608-04
2164	ravencoin	Ravencoin	rvn	0.014596	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173750113	1.04115	2023-09-13 19:40:02.520893-04
2165	stepn	STEPN	gmt	0.145276	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172543286	0.52441	2023-09-13 19:40:02.522217-04
2166	aelf	aelf	elf	0.370384	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170782529	6.9593	2023-09-13 19:40:02.523526-04
2167	golem	Golem	glm	0.166256	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	167749828	2.39633	2023-09-13 19:40:02.52625-04
2168	alchemix-usd	Alchemix USD	alusd	0.991427	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167592537	-0.17009	2023-09-13 19:40:02.529567-04
2169	jasmycoin	JasmyCoin	jasmy	0.00343648	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166375377	-1.12304	2023-09-13 19:40:02.531872-04
2170	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	165773790	-0.79544	2023-09-13 19:40:02.533637-04
2171	audius	Audius	audio	0.146029	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162750360	1.61208	2023-09-13 19:40:02.535872-04
2172	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.04565	2023-09-13 19:40:02.5378-04
2173	kusama	Kusama	ksm	17.98	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161536406	0.89144	2023-09-13 19:40:02.539456-04
2174	blur	Blur	blur	0.173529	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159728393	1.9701	2023-09-13 19:40:02.541747-04
2175	floki	FLOKI	floki	1.599e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	158978830	1.42835	2023-09-13 19:40:02.544058-04
2176	baby-doge-coin	Baby Doge Coin	babydoge	1.021e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	158701597	-1.81538	2023-09-13 19:40:02.546175-04
2177	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	154955562	1.40849	2023-09-13 19:40:02.547751-04
2178	icon	ICON	icx	0.158862	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154417921	2.65869	2023-09-13 19:40:02.549101-04
2179	link	FINSCHIA	fnsa	20.87	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	149363645	0.10549	2023-09-13 19:40:02.550407-04
2180	iotex	IoTeX	iotx	0.01571662	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148659518	2.38234	2023-09-13 19:40:02.551459-04
2181	terra-luna-2	Terra	luna	0.391119	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146146963	-0.04733	2023-09-13 19:40:02.552523-04
2182	swipe	SXP	sxp	0.253987	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146063650	3.67262	2023-09-13 19:40:02.553649-04
2183	dao-maker	DAO Maker	dao	0.741218	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141620977	0.77597	2023-09-13 19:40:02.554784-04
2184	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141120131	-0.25398	2023-09-13 19:40:02.555929-04
2185	siacoin	Siacoin	sc	0.00273821	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141031449	0.96937	2023-09-13 19:40:02.558064-04
2186	ontology	Ontology	ont	0.15701	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140196210	3.03158	2023-09-13 19:40:02.559872-04
2187	balancer	Balancer	bal	3.21	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138642503	0.46812	2023-09-13 19:40:02.561242-04
2188	ribbon-finance	Ribbon Finance	rbn	0.175904	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138326583	-2.75661	2023-09-13 19:40:02.562529-04
2189	ocean-protocol	Ocean Protocol	ocean	0.312375	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135707810	0.56773	2023-09-13 19:40:02.564019-04
2190	seth2	sETH2	seth2	1594.65	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135528961	0.8112	2023-09-13 19:40:02.565639-04
2191	axelar	Axelar	axl	0.341282	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135329896	-1.65859	2023-09-13 19:40:02.567059-04
2192	band-protocol	Band Protocol	band	0.99493	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133696207	1.65991	2023-09-13 19:40:02.568499-04
2193	stasis-eurs	STASIS EURO	eurs	1.072	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133149577	0.06445	2023-09-13 19:40:02.569773-04
2194	worldcoin-wld	Worldcoin	wld	1.013	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	131583436	-0.35864	2023-09-13 19:40:02.570889-04
2195	open-exchange-token	Open Exchange Token	ox	0.03380347	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	131511105	19.03277	2023-09-13 19:40:02.571825-04
2196	biconomy	Biconomy	bico	0.199467	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131215798	1.08136	2023-09-13 19:40:02.572802-04
2197	iostoken	IOST	iost	0.00687419	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128560963	1.75337	2023-09-13 19:40:02.57416-04
2198	kadena	Kadena	kda	0.520334	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127869920	0.88595	2023-09-13 19:40:02.576082-04
2199	wax	WAX	waxp	0.03765523	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126416637	2.06183	2023-09-13 19:40:02.577921-04
2200	merit-circle	Merit Circle	mc	0.262713	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121682317	-1.31574	2023-09-13 19:40:02.579343-04
2201	moonbeam	Moonbeam	glmr	0.165296	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121645886	-0.6588	2023-09-13 19:40:02.580363-04
2202	ronin	Ronin	ron	0.477503	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120940858	0.02815	2023-09-13 19:40:02.58169-04
2203	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.51884	2023-09-13 19:40:02.583486-04
2204	tomochain	TomoChain	tomo	1.24	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119623865	2.47158	2023-09-13 19:40:02.585011-04
2205	terrausd	TerraClassicUSD	ustc	0.01210356	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118536169	-0.22406	2023-09-13 19:40:02.586387-04
2206	sushi	Sushi	sushi	0.612551	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118033261	5.40909	2023-09-13 19:40:02.588043-04
2207	swissborg	SwissBorg	chsb	0.123182	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117194870	0.73369	2023-09-13 19:40:02.589292-04
2208	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26194	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	115935871	1.14347	2023-09-13 19:40:02.591541-04
2209	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1633.94	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115753041	0.72557	2023-09-13 19:40:02.593957-04
2210	harmony	Harmony	one	0.00939976	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115631045	1.5127	2023-09-13 19:40:02.595371-04
2211	tribe-2	Tribe	tribe	0.250268	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	115182923	-2.48314	2023-09-13 19:40:02.596855-04
2212	crvusd	crvUSD	crvusd	0.995587	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111440159	-0.14854	2023-09-13 19:40:02.598281-04
2213	skale	SKALE	skl	0.02357038	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110855130	7.67394	2023-09-13 19:40:02.59961-04
2214	bora	BORA	bora	0.111694	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	110452358	1.12369	2023-09-13 19:40:02.601081-04
2215	magic	Magic	magic	0.466601	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110396092	6.7027	2023-09-13 19:40:02.602472-04
2216	polymath	Polymath	poly	0.120626	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108798923	-0.54353	2023-09-13 19:40:02.603818-04
2217	ssv-network	SSV Network	ssv	15.21	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	107840085	1.91809	2023-09-13 19:40:02.605194-04
2218	digibyte	DigiByte	dgb	0.00644748	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106647709	3.52292	2023-09-13 19:40:02.606507-04
2219	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104403383	0.82281	2023-09-13 19:40:02.60926-04
2220	hive	Hive	hive	0.276656	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102625908	2.83171	2023-09-13 19:40:02.611382-04
2221	zelcash	Flux	flux	0.32247	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102511016	1.09324	2023-09-13 19:40:02.613222-04
2222	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.33017	2023-09-13 19:40:02.614672-04
2223	lisk	Lisk	lsk	0.706505	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	100879686	3.95385	2023-09-13 19:40:02.61603-04
2224	vethor-token	VeThor	vtho	0.00148976	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99946114	46.32616	2023-09-13 19:40:02.617233-04
2225	api3	API3	api3	1.05	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99908262	3.26855	2023-09-13 19:40:02.618294-04
2226	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	98998008	1.29254	2023-09-13 19:40:02.619609-04
2227	zencash	Horizen	zen	7	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98821943	2.14746	2023-09-13 19:40:02.620838-04
2228	echelon-prime	Echelon Prime	prime	4.25	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98408273	2.05496	2023-09-13 19:40:02.621987-04
2229	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97220525	6.56412	2023-09-13 19:40:02.623412-04
2230	msol	Marinade staked SOL	msol	20.82	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97152743	2.23214	2023-09-13 19:40:02.625328-04
2231	metal	Metal DAO	mtl	1.49	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96754377	10.29408	2023-09-13 19:40:02.627258-04
2232	amp-token	Amp	amp	0.00170956	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95726102	-0.60967	2023-09-13 19:40:02.628773-04
2233	kyber-network-crystal	Kyber Network Crystal	knc	0.516442	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94019470	2.53708	2023-09-13 19:40:02.63029-04
2234	reserve-rights-token	Reserve Rights	rsr	0.00185264	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93806949	6.2152	2023-09-13 19:40:02.631622-04
2235	everscale	Everscale	ever	0.051764	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93380641	-3.00067	2023-09-13 19:40:02.633002-04
2236	cartesi	Cartesi	ctsi	0.126956	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93277221	7.39626	2023-09-13 19:40:02.63434-04
2237	stargate-finance	Stargate Finance	stg	0.451584	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92363689	-0.05935	2023-09-13 19:40:02.635604-04
2238	blox	Blox	cdt	0.132197	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	-15.34354	2023-09-13 19:40:02.637008-04
2239	bitkub-coin	Bitkub Coin	kub	1.016	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90384512	0.5426	2023-09-13 19:40:02.638452-04
2240	krypton-dao	Krypton DAO	krd	0.875464	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89710640	-3.20265	2023-09-13 19:40:02.639824-04
2241	deso	Decentralized Social	deso	8.48	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89499288	-1.3934	2023-09-13 19:40:02.642042-04
2242	polymesh	Polymesh	polyx	0.104778	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89196987	1.76811	2023-09-13 19:40:02.643521-04
2243	nervos-network	Nervos Network	ckb	0.00266995	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89160373	2.02559	2023-09-13 19:40:02.64483-04
2244	e-radix	e-Radix	exrd	0.057409	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86992980	0.84902	2023-09-13 19:40:02.64609-04
2245	lukso-token	LUKSO [OLD]	lyxe	5.63	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86452513	-0.39484	2023-09-13 19:40:02.647296-04
2246	stp-network	STP	stpt	0.04406011	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85670408	3.84746	2023-09-13 19:40:02.648693-04
2247	status	Status	snt	0.021559	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85343693	1.39719	2023-09-13 19:40:02.649994-04
2248	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83715138	-0.47712	2023-09-13 19:40:02.651281-04
2249	pundi-x-2	Pundi X	pundix	0.323944	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83661144	2.68699	2023-09-13 19:40:02.652584-04
2250	joe	JOE	joe	0.244318	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83536454	1.04347	2023-09-13 19:40:02.654136-04
2251	bitcoin	Bitcoin	btc	26220	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	510794285088	1.26788	2023-09-13 19:40:13.954617-04
2252	ethereum	Ethereum	eth	1607.36	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193179886199	0.71995	2023-09-13 19:40:13.956137-04
2253	tether	Tether	usdt	1.001	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83032353215	0.02081	2023-09-13 19:40:13.958195-04
2254	binancecoin	BNB	bnb	212.53	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32702625508	0.46397	2023-09-13 19:40:13.960079-04
2255	usd-coin	USD Coin	usdc	1	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26217460340	-0.04685	2023-09-13 19:40:13.961452-04
2256	ripple	XRP	xrp	0.484014	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25696224427	0.76175	2023-09-13 19:40:13.962717-04
2257	staked-ether	Lido Staked Ether	steth	1607.14	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13866589374	0.86166	2023-09-13 19:40:13.964001-04
2258	cardano	Cardano	ada	0.24874	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8717575138	1.05726	2023-09-13 19:40:13.965246-04
2259	dogecoin	Dogecoin	doge	0.061243	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8636343453	0.46402	2023-09-13 19:40:13.966226-04
2260	solana	Solana	sol	18.37	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7549519877	2.21218	2023-09-13 19:40:13.967502-04
2261	tron	TRON	trx	0.081118	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7230952566	0.44476	2023-09-13 19:40:13.968618-04
2262	the-open-network	Toncoin	ton	1.91	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6523964902	4.99171	2023-09-13 19:40:13.96985-04
2263	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5100462135	0.24365	2023-09-13 19:40:13.971173-04
2264	matic-network	Polygon	matic	0.513757	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4787522417	1.27921	2023-09-13 19:40:13.972537-04
2265	litecoin	Litecoin	ltc	61.98	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4564833246	3.19375	2023-09-13 19:40:13.974699-04
2266	shiba-inu	Shiba Inu	shib	7.25e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4277195516	0.91713	2023-09-13 19:40:13.977381-04
2267	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26240	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4273031657	1.37855	2023-09-13 19:40:13.97956-04
2268	bitcoin-cash	Bitcoin Cash	bch	199.82	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3897743223	0.15782	2023-09-13 19:40:13.980975-04
2269	dai	Dai	dai	0.998838	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3836125753	-0.01242	2023-09-13 19:40:13.982267-04
2270	leo-token	LEO Token	leo	3.65	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3388563371	-0.264	2023-09-13 19:40:13.983448-04
2271	stellar	Stellar	xlm	0.120589	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3316967523	-0.70555	2023-09-13 19:40:13.98483-04
2272	avalanche-2	Avalanche	avax	9.3	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3292799785	0.82185	2023-09-13 19:40:13.986271-04
2273	chainlink	Chainlink	link	6.02	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3235966194	0.83329	2023-09-13 19:40:13.987392-04
2274	uniswap	Uniswap	uni	4.25	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3206400424	1.05853	2023-09-13 19:40:13.988692-04
2275	true-usd	TrueUSD	tusd	0.999014	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3150526214	0.11655	2023-09-13 19:40:13.990236-04
2276	monero	Monero	xmr	143.01	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2596264211	1.49728	2023-09-13 19:40:13.992482-04
2277	okb	OKB	okb	42.08	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2524520164	1.06197	2023-09-13 19:40:13.994656-04
2278	binance-usd	Binance USD	busd	1	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515062438	0.08344	2023-09-13 19:40:13.996152-04
2279	ethereum-classic	Ethereum Classic	etc	15.14	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2165371512	0.9349	2023-09-13 19:40:13.997453-04
2280	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1913131414	2.45278	2023-09-13 19:40:13.998987-04
2281	hedera-hashgraph	Hedera	hbar	0.04972617	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1650430331	5.86913	2023-09-13 19:40:14.000351-04
2282	filecoin	Filecoin	fil	3.17	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1418489041	2.73343	2023-09-13 19:40:14.001271-04
2283	quant-network	Quant	qnt	92.72	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1346237101	-0.11772	2023-09-13 19:40:14.002165-04
2284	crypto-com-chain	Cronos	cro	0.050506	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326768727	0.60865	2023-09-13 19:40:14.003277-04
2285	lido-dao	Lido DAO	ldo	1.48	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1320952818	1.30925	2023-09-13 19:40:14.005058-04
2286	mantle	Mantle	mnt	0.407314	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316998530	-0.00935	2023-09-13 19:40:14.007574-04
2287	internet-computer	Internet Computer	icp	2.93	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1302204464	-0.26085	2023-09-13 19:40:14.009907-04
2288	aptos	Aptos	apt	5.2	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1222684515	2.91612	2023-09-13 19:40:14.011684-04
2289	vechain	VeChain	vet	0.01661404	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1204937070	1.08321	2023-09-13 19:40:14.013091-04
2290	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1081553520	1.03251	2023-09-13 19:40:14.014318-04
2291	maker	Maker	mkr	1156.59	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1042240940	3.07009	2023-09-13 19:40:14.015563-04
2292	near	NEAR Protocol	near	1.089	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1024336784	1.80532	2023-09-13 19:40:14.016881-04
2293	kaspa	Kaspa	kas	0.04950301	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1007111596	16.51414	2023-09-13 19:40:14.018105-04
2294	arbitrum	Arbitrum	arb	0.786675	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002416619	-0.06819	2023-09-13 19:40:14.019392-04
2295	rocket-pool-eth	Rocket Pool ETH	reth	1742.3	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	914993469	0.73669	2023-09-13 19:40:14.020622-04
2296	aave	Aave	aave	53.66	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	780310030	1.10155	2023-09-13 19:40:14.021722-04
2297	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	761182298	0.17262	2023-09-13 19:40:14.022896-04
2298	the-graph	The Graph	grt	0.082434	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	757544152	3.65792	2023-09-13 19:40:14.024653-04
2299	usdd	USDD	usdd	0.998617	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724218844	0.06042	2023-09-13 19:40:14.026634-04
2300	xdce-crowd-sale	XDC Network	xdc	0.052109	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	722632291	-1.30464	2023-09-13 19:40:14.028429-04
2301	algorand	Algorand	algo	0.090897	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	711535636	1.50412	2023-09-13 19:40:14.030005-04
2302	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	675226525	2.67366	2023-09-13 19:40:14.031133-04
2303	frax	Frax	frax	0.995094	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669022378	0.005	2023-09-13 19:40:14.032273-04
2304	blockstack	Stacks	stx	0.4588	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	645624346	3.88071	2023-09-13 19:40:14.033499-04
2305	eos	EOS	eos	0.55476	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621471719	1.28221	2023-09-13 19:40:14.034613-04
2306	bitget-token	Bitget Token	bgb	0.441145	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617377868	0.042	2023-09-13 19:40:14.035518-04
2307	elrond-erd-2	MultiversX	egld	23.51	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	609909828	2.59321	2023-09-13 19:40:14.036442-04
2308	tezos	Tezos	xtz	0.644033	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	608718029	1.32412	2023-09-13 19:40:14.037366-04
2309	the-sandbox	The Sandbox	sand	0.290156	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	599858726	2.56893	2023-09-13 19:40:14.038367-04
2310	bitcoin-cash-sv	Bitcoin SV	bsv	30.81	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593379059	-0.5559	2023-09-13 19:40:14.039463-04
2311	theta-token	Theta Network	theta	0.591371	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	591674047	1.60575	2023-09-13 19:40:14.04163-04
2312	radix	Radix	xrd	0.056834	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	583106717	-0.3479	2023-09-13 19:40:14.043308-04
2313	injective-protocol	Injective	inj	6.91	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	578643103	1.50607	2023-09-13 19:40:14.044981-04
2314	immutable-x	ImmutableX	imx	0.492951	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576279209	1.53431	2023-09-13 19:40:14.046183-04
2315	render-token	Render	rndr	1.52	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	566384324	0.99027	2023-09-13 19:40:14.047453-04
2316	axie-infinity	Axie Infinity	axs	4.25	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	557937336	1.44437	2023-09-13 19:40:14.048817-04
2317	fantom	Fantom	ftm	0.191535	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	537293246	2.26747	2023-09-13 19:40:14.050039-04
2318	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529550508	0.04954	2023-09-13 19:40:14.051134-04
2319	paxos-standard	Pax Dollar	usdp	0.999585	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517152265	-0.02408	2023-09-13 19:40:14.052253-04
2320	decentraland	Decentraland	mana	0.279842	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516065574	3.72077	2023-09-13 19:40:14.053217-04
2321	neo	NEO	neo	7.28	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	513345381	3.25485	2023-09-13 19:40:14.054596-04
2322	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	481661765	7.56374	2023-09-13 19:40:14.05681-04
2323	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:40:14.059306-04
2324	kava	Kava	kava	0.618635	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472732957	1.72426	2023-09-13 19:40:14.061682-04
2325	tether-gold	Tether Gold	xaut	1910.25	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470734170	-0.06937	2023-09-13 19:40:14.063678-04
2326	pax-gold	PAX Gold	paxg	1888.87	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	469027852	-0.12097	2023-09-13 19:40:14.06556-04
2327	iota	IOTA	miota	0.168392	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	467972757	4.44402	2023-09-13 19:40:14.06727-04
2328	rollbit-coin	Rollbit Coin	rlb	0.142315	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	467542095	-4.26197	2023-09-13 19:40:14.068719-04
2329	ecash	eCash	xec	2.302e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	447213263	1.93427	2023-09-13 19:40:14.070584-04
2330	rocket-pool	Rocket Pool	rpl	21.88	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	435497469	-0.93165	2023-09-13 19:40:14.07177-04
2331	flow	Flow	flow	0.41803	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433082851	2.38718	2023-09-13 19:40:14.073353-04
2332	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423225104	1.3942	2023-09-13 19:40:14.076492-04
2333	frax-ether	Frax Ether	frxeth	1604.5	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415636884	0.81539	2023-09-13 19:40:14.078518-04
2334	tokenize-xchange	Tokenize Xchange	tkx	5.17	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414559015	0.51018	2023-09-13 19:40:14.080303-04
2335	kucoin-shares	KuCoin	kcs	4.24	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	409928467	2.38559	2023-09-13 19:40:14.081703-04
2336	chiliz	Chiliz	chz	0.056403	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393877629	1.09034	2023-09-13 19:40:14.083453-04
2337	first-digital-usd	First Digital USD	fdusd	0.999808	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393104054	-0.11716	2023-09-13 19:40:14.08474-04
2338	frax-share	Frax Share	fxs	5.32	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	391261031	4.11248	2023-09-13 19:40:14.085837-04
2339	klay-token	Klaytn	klay	0.121199	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	386068947	-2.04957	2023-09-13 19:40:14.086883-04
2340	huobi-token	Huobi	ht	2.37	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376966402	0.87682	2023-09-13 19:40:14.088129-04
2341	casper-network	Casper Network	cspr	0.0326853	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	370094928	0.09872	2023-09-13 19:40:14.089522-04
2342	bittorrent	BitTorrent	btt	3.87731e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368825542	0.32102	2023-09-13 19:40:14.092071-04
2343	gala	GALA	gala	0.01409226	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368665086	1.22216	2023-09-13 19:40:14.094313-04
2344	curve-dao-token	Curve DAO	crv	0.416186	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365249897	3.72141	2023-09-13 19:40:14.09586-04
2345	mina-protocol	Mina Protocol	mina	0.374744	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362975972	1.62012	2023-09-13 19:40:14.097678-04
2346	sui	Sui	sui	0.441446	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	349471306	3.16519	2023-09-13 19:40:14.098938-04
2347	dydx	dYdX	dydx	1.93	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339585779	2.27116	2023-09-13 19:40:14.100047-04
2348	terra-luna	Terra Luna Classic	lunc	5.797e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	337830346	1.20425	2023-09-13 19:40:14.101078-04
2349	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1684.96	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333299610	0.81903	2023-09-13 19:40:14.102185-04
2350	trust-wallet-token	Trust Wallet	twt	0.782112	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	325748944	0.40123	2023-09-13 19:40:14.103418-04
2351	nexo	NEXO	nexo	0.561523	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319612831	-3.26331	2023-09-13 19:40:14.10449-04
2352	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.78916	2023-09-13 19:40:14.105488-04
2353	gemini-dollar	Gemini Dollar	gusd	0.99883	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307432315	0.06213	2023-09-13 19:40:14.106679-04
2354	apenft	APENFT	nft	3.03178e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300125669	0.58609	2023-09-13 19:40:14.109148-04
2355	dash	Dash	dash	25.59	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293192958	0.99528	2023-09-13 19:40:14.111615-04
2356	staked-frax-ether	Staked Frax Ether	sfrxeth	1696.6	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293020562	0.92775	2023-09-13 19:40:14.113769-04
2357	compound-usdt	cUSDT	cusdt	0.02700283	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	286438126	12.29404	2023-09-13 19:40:14.11559-04
2358	gmx	GMX	gmx	31.64	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285154236	0.75517	2023-09-13 19:40:14.117141-04
2359	pepe	Pepe	pepe	6.76069e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284664210	0.13963	2023-09-13 19:40:14.11894-04
2360	liquity-usd	Liquity USD	lusd	0.995819	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282623019	0.0378	2023-09-13 19:40:14.120555-04
2361	astar	Astar	astr	0.053125	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	279480293	-5.63691	2023-09-13 19:40:14.121795-04
2362	woo-network	WOO Network	woo	0.157833	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	276573736	1.89242	2023-09-13 19:40:14.123746-04
2363	zilliqa	Zilliqa	zil	0.01606495	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	273487478	5.8231	2023-09-13 19:40:14.12537-04
2364	compound-governance-token	Compound	comp	39.78	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271924857	8.11267	2023-09-13 19:40:14.126434-04
2365	arweave	Arweave	ar	4.04	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	264418384	1.9146	2023-09-13 19:40:14.127536-04
2366	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:40:14.128877-04
2367	flare-networks	Flare	flr	0.01125503	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263679373	-3.97257	2023-09-13 19:40:14.130098-04
2368	defichain	DeFiChain	dfi	0.351463	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262264593	5.87253	2023-09-13 19:40:14.131334-04
2369	safepal	SafePal	sfp	0.614248	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258541316	5.34511	2023-09-13 19:40:14.132326-04
2370	gnosis	Gnosis	gno	99.21	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257868285	1.18631	2023-09-13 19:40:14.133337-04
2371	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255166280	0.49118	2023-09-13 19:40:14.134356-04
2372	basic-attention-token	Basic Attention	bat	0.166914	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248484484	3.29924	2023-09-13 19:40:14.135386-04
2373	1inch	1inch	1inch	0.234626	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241300058	2.88406	2023-09-13 19:40:14.136474-04
2374	chia	Chia	xch	28.27	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238819815	2.87585	2023-09-13 19:40:14.137451-04
2375	conflux-token	Conflux	cfx	0.113482	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	238408851	0.71043	2023-09-13 19:40:14.138602-04
2376	fetch-ai	Fetch.ai	fet	0.224106	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234216685	-0.48256	2023-09-13 19:40:14.139831-04
2377	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233717071	1.19005	2023-09-13 19:40:14.141866-04
2378	oec-token	OKT Chain	okt	13.06	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233227160	-0.34269	2023-09-13 19:40:14.143297-04
2379	illuvium	Illuvium	ilv	39.92	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232845187	-0.2493	2023-09-13 19:40:14.145278-04
2380	huobi-btc	Huobi BTC	hbtc	25792	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231609712	-0.65694	2023-09-13 19:40:14.146979-04
2381	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.57914	2023-09-13 19:40:14.148648-04
2382	ecomi	ECOMI	omi	0.00084253	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227668840	0.57866	2023-09-13 19:40:14.150012-04
2383	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226963199	-2.13344	2023-09-13 19:40:14.151267-04
2384	enjincoin	Enjin Coin	enj	0.223542	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223266890	-1.20694	2023-09-13 19:40:14.152544-04
2385	singularitynet	SingularityNET	agix	0.179878	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	221706770	3.62788	2023-09-13 19:40:14.15399-04
2386	tether-eurt	Euro Tether	eurt	1.074	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221280020	-0.25174	2023-09-13 19:40:14.155199-04
2387	loopring	Loopring	lrc	0.176846	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220610818	1.37822	2023-09-13 19:40:14.156658-04
2388	nem	NEM	xem	0.02444104	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220179552	1.7231	2023-09-13 19:40:14.158929-04
2389	bitcoin-gold	Bitcoin Gold	btg	12.96	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219534562	-1.29134	2023-09-13 19:40:14.16089-04
2390	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219323029	1.58642	2023-09-13 19:40:14.16274-04
2391	celo	Celo	celo	0.422227	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216378052	1.78857	2023-09-13 19:40:14.164163-04
2392	sei-network	Sei	sei	0.119104	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214756415	0.7712	2023-09-13 19:40:14.165472-04
2393	zcash	Zcash	zec	25.34	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205007304	2.07809	2023-09-13 19:40:14.16661-04
2394	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204722126	2.28421	2023-09-13 19:40:14.167754-04
2395	osmosis	Osmosis	osmo	0.325877	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200606024	0.79703	2023-09-13 19:40:14.168977-04
2396	decred	Decred	dcr	12.95	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200561191	2.73521	2023-09-13 19:40:14.170181-04
2397	helium	Helium	hnt	1.38	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	198987858	-2.64603	2023-09-13 19:40:14.171482-04
2398	oasis-network	Oasis Network	rose	0.03918217	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197019075	2.69695	2023-09-13 19:40:14.17268-04
2399	theta-fuel	Theta Fuel	tfuel	0.03075488	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193188936	2.01088	2023-09-13 19:40:14.175072-04
2400	olympus	Olympus	ohm	11.11	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192983931	-0.28991	2023-09-13 19:40:14.176905-04
2401	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192062404	1.09053	2023-09-13 19:40:14.179104-04
2402	bone-shibaswap	Bone ShibaSwap	bone	0.823094	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189294573	-1.40116	2023-09-13 19:40:14.180485-04
2403	akash-network	Akash Network	akt	0.854439	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186741022	-6.45492	2023-09-13 19:40:14.181929-04
2404	holotoken	Holo	hot	0.00105065	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186607630	0.85671	2023-09-13 19:40:14.183187-04
2405	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	185703276	1.22211	2023-09-13 19:40:14.184604-04
2406	just	JUST	jst	0.02079662	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184804599	2.00196	2023-09-13 19:40:14.185924-04
2407	aleph-zero	Aleph Zero	azero	0.764228	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184516160	-2.04465	2023-09-13 19:40:14.18721-04
2408	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:40:14.188458-04
2409	ankr	Ankr Network	ankr	0.01822618	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182328053	3.96193	2023-09-13 19:40:14.1896-04
2410	beldex	Beldex	bdx	0.03174564	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177283882	-0.2503	2023-09-13 19:40:14.191946-04
2411	wemix-token	WEMIX	wemix	0.559915	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177169270	-0.76798	2023-09-13 19:40:14.193524-04
2412	yearn-finance	yearn.finance	yfi	5303.37	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175420294	2.16825	2023-09-13 19:40:14.195185-04
2413	livepeer	Livepeer	lpt	6.01	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174684645	0.82476	2023-09-13 19:40:14.196523-04
2414	ravencoin	Ravencoin	rvn	0.01459737	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173750113	1.05062	2023-09-13 19:40:14.197978-04
2415	stepn	STEPN	gmt	0.145277	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172543286	0.5253	2023-09-13 19:40:14.199154-04
2416	aelf	aelf	elf	0.370403	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	170782529	6.96464	2023-09-13 19:40:14.200331-04
2417	golem	Golem	glm	0.166271	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	167749828	2.40503	2023-09-13 19:40:14.201426-04
2418	alchemix-usd	Alchemix USD	alusd	0.991427	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167592537	-0.17009	2023-09-13 19:40:14.202619-04
2419	jasmycoin	JasmyCoin	jasmy	0.00343745	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166375377	-1.09521	2023-09-13 19:40:14.203803-04
2420	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	165773790	-0.90683	2023-09-13 19:40:14.204968-04
2421	audius	Audius	audio	0.146071	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162750360	1.64155	2023-09-13 19:40:14.206163-04
2422	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.04565	2023-09-13 19:40:14.207821-04
2423	kusama	Kusama	ksm	17.98	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161536406	0.89275	2023-09-13 19:40:14.209343-04
2424	blur	Blur	blur	0.173537	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159728393	1.97487	2023-09-13 19:40:14.210723-04
2425	floki	FLOKI	floki	1.599e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	158978830	1.43058	2023-09-13 19:40:14.212091-04
2426	baby-doge-coin	Baby Doge Coin	babydoge	1.021e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	158701597	-1.81146	2023-09-13 19:40:14.21377-04
2427	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	154955562	1.42703	2023-09-13 19:40:14.215369-04
2428	icon	ICON	icx	0.158892	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154417921	2.67835	2023-09-13 19:40:14.217114-04
2429	link	FINSCHIA	fnsa	20.86	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	149363645	0.06689	2023-09-13 19:40:14.218747-04
2430	iotex	IoTeX	iotx	0.01571133	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148659518	2.34783	2023-09-13 19:40:14.219883-04
2431	terra-luna-2	Terra	luna	0.391159	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146146963	-0.0371	2023-09-13 19:40:14.221071-04
2432	swipe	SXP	sxp	0.25392	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146063650	3.64542	2023-09-13 19:40:14.222235-04
2433	dao-maker	DAO Maker	dao	0.740953	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141620977	0.73998	2023-09-13 19:40:14.223614-04
2434	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141120131	-0.23204	2023-09-13 19:40:14.22554-04
2435	siacoin	Siacoin	sc	0.00274007	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141031449	1.03787	2023-09-13 19:40:14.227266-04
2436	ontology	Ontology	ont	0.157019	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140196210	3.03747	2023-09-13 19:40:14.228986-04
2437	balancer	Balancer	bal	3.21	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138642503	0.40086	2023-09-13 19:40:14.230672-04
2438	ribbon-finance	Ribbon Finance	rbn	0.175729	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138326583	-2.85343	2023-09-13 19:40:14.231958-04
2439	ocean-protocol	Ocean Protocol	ocean	0.3125	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135707810	0.6079	2023-09-13 19:40:14.233183-04
2440	seth2	sETH2	seth2	1594.72	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135528961	0.81574	2023-09-13 19:40:14.234393-04
2441	axelar	Axelar	axl	0.341297	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135329896	-1.65427	2023-09-13 19:40:14.235487-04
2442	band-protocol	Band Protocol	band	0.99491	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133696207	1.65788	2023-09-13 19:40:14.236726-04
2443	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133149577	0.08983	2023-09-13 19:40:14.23812-04
2444	worldcoin-wld	Worldcoin	wld	1.013	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	131583436	-0.35352	2023-09-13 19:40:14.239451-04
2445	open-exchange-token	Open Exchange Token	ox	0.03380558	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	131511105	19.04019	2023-09-13 19:40:14.241447-04
2446	biconomy	Biconomy	bico	0.199334	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131215798	1.01394	2023-09-13 19:40:14.243416-04
2447	iostoken	IOST	iost	0.00687289	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128560963	1.73409	2023-09-13 19:40:14.244903-04
2448	kadena	Kadena	kda	0.52031	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127869920	0.88122	2023-09-13 19:40:14.246462-04
2449	wax	WAX	waxp	0.03766571	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126416637	2.09025	2023-09-13 19:40:14.24795-04
2450	merit-circle	Merit Circle	mc	0.262718	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121682317	-1.31393	2023-09-13 19:40:14.249238-04
2451	moonbeam	Moonbeam	glmr	0.165281	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121645886	-0.66804	2023-09-13 19:40:14.250481-04
2452	ronin	Ronin	ron	0.477513	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120940858	0.03014	2023-09-13 19:40:14.251916-04
2453	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.51884	2023-09-13 19:40:14.253233-04
2454	tomochain	TomoChain	tomo	1.24	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119623865	2.47964	2023-09-13 19:40:14.254658-04
2455	terrausd	TerraClassicUSD	ustc	0.01210276	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118536169	-0.23059	2023-09-13 19:40:14.255953-04
2456	sushi	Sushi	sushi	0.612986	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118033261	5.48396	2023-09-13 19:40:14.257998-04
2457	swissborg	SwissBorg	chsb	0.123231	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117194870	0.77364	2023-09-13 19:40:14.259647-04
2458	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26195	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	115935871	1.14803	2023-09-13 19:40:14.261268-04
2459	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1633.94	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115753041	0.72557	2023-09-13 19:40:14.262694-04
2460	harmony	Harmony	one	0.00939774	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115631045	1.49091	2023-09-13 19:40:14.263928-04
2461	tribe-2	Tribe	tribe	0.25028	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	115182923	-2.47875	2023-09-13 19:40:14.265154-04
2462	crvusd	crvUSD	crvusd	0.995631	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111440159	-0.14413	2023-09-13 19:40:14.266258-04
2463	skale	SKALE	skl	0.02359814	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110855130	7.80074	2023-09-13 19:40:14.267534-04
2464	bora	BORA	bora	0.111694	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	110452358	1.12369	2023-09-13 19:40:14.269575-04
2465	magic	Magic	magic	0.466627	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110396092	6.70858	2023-09-13 19:40:14.270668-04
2466	polymath	Polymath	poly	0.120632	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108798923	-0.53905	2023-09-13 19:40:14.274022-04
2467	ssv-network	SSV Network	ssv	15.21	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	107840085	1.91415	2023-09-13 19:40:14.275615-04
2468	digibyte	DigiByte	dgb	0.00645296	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106647709	3.61087	2023-09-13 19:40:14.276921-04
2469	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104403383	0.81746	2023-09-13 19:40:14.278489-04
2470	hive	Hive	hive	0.27661	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102625908	2.81457	2023-09-13 19:40:14.280043-04
2471	zelcash	Flux	flux	0.322347	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102511016	1.05458	2023-09-13 19:40:14.281609-04
2472	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.33017	2023-09-13 19:40:14.283129-04
2473	lisk	Lisk	lsk	0.706537	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	100879686	3.9586	2023-09-13 19:40:14.284323-04
2474	vethor-token	VeThor	vtho	0.00148694	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99946114	46.04955	2023-09-13 19:40:14.285467-04
2475	api3	API3	api3	1.049	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99908262	3.22908	2023-09-13 19:40:14.287472-04
2476	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	98998008	1.26339	2023-09-13 19:40:14.288724-04
2477	zencash	Horizen	zen	7.01	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98821943	2.23201	2023-09-13 19:40:14.289914-04
2478	echelon-prime	Echelon Prime	prime	4.25	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98408273	2.05908	2023-09-13 19:40:14.292384-04
2479	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97220525	6.56729	2023-09-13 19:40:14.29384-04
2480	msol	Marinade staked SOL	msol	20.82	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97152743	2.26504	2023-09-13 19:40:14.295112-04
2481	metal	Metal DAO	mtl	1.48	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96754377	9.55046	2023-09-13 19:40:14.29641-04
2482	amp-token	Amp	amp	0.00170844	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95726102	-0.67465	2023-09-13 19:40:14.297661-04
2483	kyber-network-crystal	Kyber Network Crystal	knc	0.516292	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94019470	2.50718	2023-09-13 19:40:14.298779-04
2484	reserve-rights-token	Reserve Rights	rsr	0.00185265	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93806949	6.21566	2023-09-13 19:40:14.29983-04
2485	everscale	Everscale	ever	0.051767	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93380641	-2.9963	2023-09-13 19:40:14.300896-04
2486	cartesi	Cartesi	ctsi	0.126777	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93277221	7.24501	2023-09-13 19:40:14.302045-04
2487	stargate-finance	Stargate Finance	stg	0.451607	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92363689	-0.05425	2023-09-13 19:40:14.303125-04
2488	blox	Blox	cdt	0.132197	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	-15.34354	2023-09-13 19:40:14.304283-04
2489	bitkub-coin	Bitkub Coin	kub	1.016	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90384512	0.55999	2023-09-13 19:40:14.305492-04
2490	krypton-dao	Krypton DAO	krd	0.875464	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89710640	-3.20265	2023-09-13 19:40:14.306741-04
2491	deso	Decentralized Social	deso	8.48	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89499288	-1.40771	2023-09-13 19:40:14.309065-04
2492	polymesh	Polymesh	polyx	0.104782	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89196987	1.77189	2023-09-13 19:40:14.310978-04
2493	nervos-network	Nervos Network	ckb	0.00266978	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89160373	2.01891	2023-09-13 19:40:14.312458-04
2494	e-radix	e-Radix	exrd	0.057414	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86992980	0.85762	2023-09-13 19:40:14.313759-04
2495	lukso-token	LUKSO [OLD]	lyxe	5.63	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86452513	-0.38968	2023-09-13 19:40:14.314856-04
2496	stp-network	STP	stpt	0.04406183	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85670408	3.85151	2023-09-13 19:40:14.315893-04
2497	status	Status	snt	0.02154515	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85343693	1.33209	2023-09-13 19:40:14.317017-04
2498	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83715138	-0.47712	2023-09-13 19:40:14.318048-04
2499	pundi-x-2	Pundi X	pundix	0.32394	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83661144	2.68566	2023-09-13 19:40:14.319018-04
2500	joe	JOE	joe	0.244344	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83536454	1.05392	2023-09-13 19:40:14.319924-04
2501	bitcoin	Bitcoin	btc	26219	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	510794285088	1.2624	2023-09-13 19:41:03.541658-04
2502	ethereum	Ethereum	eth	1607.07	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193179886199	0.70139	2023-09-13 19:41:03.544083-04
2503	tether	Tether	usdt	1	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83032353215	0.00039	2023-09-13 19:41:03.546448-04
2504	binancecoin	BNB	bnb	212.49	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32702625508	0.44318	2023-09-13 19:41:03.548047-04
2505	usd-coin	USD Coin	usdc	1	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26217460340	-0.08511	2023-09-13 19:41:03.549415-04
2506	ripple	XRP	xrp	0.483916	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25696224427	0.74139	2023-09-13 19:41:03.55104-04
2507	staked-ether	Lido Staked Ether	steth	1607.15	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13866589374	0.86219	2023-09-13 19:41:03.552459-04
2508	cardano	Cardano	ada	0.248726	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8717575138	1.05165	2023-09-13 19:41:03.553954-04
2509	dogecoin	Dogecoin	doge	0.061243	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8636343453	0.46391	2023-09-13 19:41:03.555436-04
2510	solana	Solana	sol	18.37	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7549519877	2.31575	2023-09-13 19:41:03.556853-04
2511	tron	TRON	trx	0.081129	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7230952566	0.45764	2023-09-13 19:41:03.558512-04
2512	the-open-network	Toncoin	ton	1.9	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6523964902	4.9462	2023-09-13 19:41:03.560069-04
2513	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5100462135	0.2443	2023-09-13 19:41:03.562207-04
2514	matic-network	Polygon	matic	0.513637	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4787522417	1.25565	2023-09-13 19:41:03.564317-04
2515	litecoin	Litecoin	ltc	61.96	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4564833246	3.16749	2023-09-13 19:41:03.566149-04
2516	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4277195516	0.94506	2023-09-13 19:41:03.567622-04
2517	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26239	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4273031657	1.37438	2023-09-13 19:41:03.569053-04
2518	bitcoin-cash	Bitcoin Cash	bch	199.81	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3897743223	0.14968	2023-09-13 19:41:03.570754-04
2519	dai	Dai	dai	0.998437	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3836125753	-0.05917	2023-09-13 19:41:03.572528-04
2520	leo-token	LEO Token	leo	3.64	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3388563371	-0.53458	2023-09-13 19:41:03.574834-04
2521	stellar	Stellar	xlm	0.12063	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3316967523	-0.67243	2023-09-13 19:41:03.577611-04
2522	avalanche-2	Avalanche	avax	9.3	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3292799785	0.81456	2023-09-13 19:41:03.57937-04
2523	chainlink	Chainlink	link	6.02	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3235966194	0.83787	2023-09-13 19:41:03.58189-04
2524	uniswap	Uniswap	uni	4.25	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3206400424	1.06407	2023-09-13 19:41:03.58351-04
2525	true-usd	TrueUSD	tusd	0.998935	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3150526214	0.10856	2023-09-13 19:41:03.584816-04
2526	monero	Monero	xmr	143	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2596264211	1.48737	2023-09-13 19:41:03.586122-04
2527	okb	OKB	okb	42.08	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2524520164	1.04595	2023-09-13 19:41:03.587498-04
2528	binance-usd	Binance USD	busd	0.999979	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515062438	0.06781	2023-09-13 19:41:03.588762-04
2529	ethereum-classic	Ethereum Classic	etc	15.14	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2165371512	0.97409	2023-09-13 19:41:03.589977-04
2530	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1913131414	2.4562	2023-09-13 19:41:03.593051-04
2531	hedera-hashgraph	Hedera	hbar	0.04975554	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1650430331	5.93166	2023-09-13 19:41:03.595552-04
2532	filecoin	Filecoin	fil	3.17	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1418489041	2.74375	2023-09-13 19:41:03.597406-04
2533	quant-network	Quant	qnt	92.7	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1346237101	-0.14584	2023-09-13 19:41:03.599053-04
2534	crypto-com-chain	Cronos	cro	0.050504	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326768727	0.60479	2023-09-13 19:41:03.600324-04
2535	lido-dao	Lido DAO	ldo	1.48	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1320952818	1.29246	2023-09-13 19:41:03.601736-04
2536	mantle	Mantle	mnt	0.407266	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316998530	-0.02118	2023-09-13 19:41:03.603029-04
2537	internet-computer	Internet Computer	icp	2.93	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1302204464	-0.26786	2023-09-13 19:41:03.604456-04
2538	aptos	Aptos	apt	5.19	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1222684515	2.80619	2023-09-13 19:41:03.605587-04
2539	vechain	VeChain	vet	0.01659505	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1204937070	0.96764	2023-09-13 19:41:03.606843-04
2540	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1081553520	0.96212	2023-09-13 19:41:03.60881-04
2541	maker	Maker	mkr	1156.28	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1042240940	3.04249	2023-09-13 19:41:03.611626-04
2542	near	NEAR Protocol	near	1.089	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1024336784	1.85062	2023-09-13 19:41:03.613561-04
2543	kaspa	Kaspa	kas	0.04956214	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1007111596	16.65332	2023-09-13 19:41:03.615037-04
2544	arbitrum	Arbitrum	arb	0.786422	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002416619	-0.10039	2023-09-13 19:41:03.616404-04
2545	rocket-pool-eth	Rocket Pool ETH	reth	1742.3	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	914993469	0.7369	2023-09-13 19:41:03.617624-04
2546	aave	Aave	aave	53.65	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	779878959	1.08496	2023-09-13 19:41:03.618956-04
2547	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	761182298	0.10112	2023-09-13 19:41:03.620311-04
2548	the-graph	The Graph	grt	0.082397	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	757544152	3.61197	2023-09-13 19:41:03.62176-04
2549	usdd	USDD	usdd	0.998357	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724218844	0.0344	2023-09-13 19:41:03.623126-04
2550	xdce-crowd-sale	XDC Network	xdc	0.052093	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	722632291	-1.47472	2023-09-13 19:41:03.625485-04
2551	algorand	Algorand	algo	0.090899	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	711687052	1.50618	2023-09-13 19:41:03.628747-04
2552	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	675226525	2.69968	2023-09-13 19:41:03.631032-04
2553	frax	Frax	frax	0.994948	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669022378	-0.00966	2023-09-13 19:41:03.63267-04
2554	blockstack	Stacks	stx	0.458808	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	645624346	3.88264	2023-09-13 19:41:03.634403-04
2555	eos	EOS	eos	0.554697	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621471719	1.27062	2023-09-13 19:41:03.635758-04
2556	bitget-token	Bitget Token	bgb	0.4405	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617377868	-0.1044	2023-09-13 19:41:03.637119-04
2557	elrond-erd-2	MultiversX	egld	23.52	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	609909828	2.64478	2023-09-13 19:41:03.638249-04
2558	tezos	Tezos	xtz	0.644133	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	608718029	1.33972	2023-09-13 19:41:03.639354-04
2559	the-sandbox	The Sandbox	sand	0.290102	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	599858726	2.54983	2023-09-13 19:41:03.640767-04
2560	bitcoin-cash-sv	Bitcoin SV	bsv	30.81	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593379059	-0.56523	2023-09-13 19:41:03.643521-04
2561	theta-token	Theta Network	theta	0.591312	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	591674047	1.59562	2023-09-13 19:41:03.645162-04
2562	radix	Radix	xrd	0.05683	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	583106717	-0.35587	2023-09-13 19:41:03.647103-04
2563	injective-protocol	Injective	inj	6.92	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	578643103	1.60636	2023-09-13 19:41:03.648778-04
2564	immutable-x	ImmutableX	imx	0.492961	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576279209	1.53628	2023-09-13 19:41:03.650548-04
2565	render-token	Render	rndr	1.52	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	566384324	1.03754	2023-09-13 19:41:03.65216-04
2566	axie-infinity	Axie Infinity	axs	4.25	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	557937336	1.4358	2023-09-13 19:41:03.65346-04
2567	fantom	Fantom	ftm	0.1915	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	537293246	2.24872	2023-09-13 19:41:03.654648-04
2568	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529550508	0.01762	2023-09-13 19:41:03.656285-04
2569	paxos-standard	Pax Dollar	usdp	0.999593	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517152265	-0.03928	2023-09-13 19:41:03.659009-04
2570	decentraland	Decentraland	mana	0.279927	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516065574	3.75214	2023-09-13 19:41:03.661366-04
2571	neo	NEO	neo	7.29	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	513345381	3.33682	2023-09-13 19:41:03.662992-04
2572	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	481661765	7.56488	2023-09-13 19:41:03.664666-04
2573	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:41:03.666453-04
2574	kava	Kava	kava	0.618775	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472732957	1.74725	2023-09-13 19:41:03.667968-04
2575	tether-gold	Tether Gold	xaut	1909.27	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470734170	-0.12103	2023-09-13 19:41:03.669289-04
2576	pax-gold	PAX Gold	paxg	1888.65	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	469027852	-0.1326	2023-09-13 19:41:03.670718-04
2577	iota	IOTA	miota	0.168413	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	467972757	4.45671	2023-09-13 19:41:03.67215-04
2578	rollbit-coin	Rollbit Coin	rlb	0.142315	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	467542095	-4.26177	2023-09-13 19:41:03.673782-04
2579	ecash	eCash	xec	2.299e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	447213263	1.81173	2023-09-13 19:41:03.675646-04
2580	rocket-pool	Rocket Pool	rpl	21.9	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	435497469	-0.87439	2023-09-13 19:41:03.678093-04
2581	flow	Flow	flow	0.418238	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433082851	2.43828	2023-09-13 19:41:03.679991-04
2582	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423225104	1.38359	2023-09-13 19:41:03.681633-04
2583	frax-ether	Frax Ether	frxeth	1604.54	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415636884	0.8182	2023-09-13 19:41:03.683342-04
2584	tokenize-xchange	Tokenize Xchange	tkx	5.17	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414559015	0.51018	2023-09-13 19:41:03.684942-04
2585	kucoin-shares	KuCoin	kcs	4.25	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	409928467	2.62734	2023-09-13 19:41:03.686481-04
2586	chiliz	Chiliz	chz	0.056408	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393877629	1.09901	2023-09-13 19:41:03.687805-04
2587	first-digital-usd	First Digital USD	fdusd	0.999836	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393104054	-0.02836	2023-09-13 19:41:03.689105-04
2588	frax-share	Frax Share	fxs	5.31	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	391261031	3.95509	2023-09-13 19:41:03.690786-04
2589	klay-token	Klaytn	klay	0.121227	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	386068947	-2.02741	2023-09-13 19:41:03.692896-04
2590	huobi-token	Huobi	ht	2.36	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376966402	0.77631	2023-09-13 19:41:03.694589-04
2591	casper-network	Casper Network	cspr	0.03266534	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	370094928	0.03758	2023-09-13 19:41:03.695942-04
2592	bittorrent	BitTorrent	btt	3.87981e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368825542	0.38569	2023-09-13 19:41:03.697314-04
2593	gala	GALA	gala	0.01410624	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368665086	1.32258	2023-09-13 19:41:03.698549-04
2594	curve-dao-token	Curve DAO	crv	0.416262	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365249897	3.74027	2023-09-13 19:41:03.699728-04
2595	mina-protocol	Mina Protocol	mina	0.374297	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362975972	1.49887	2023-09-13 19:41:03.700935-04
2596	sui	Sui	sui	0.441456	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	349471306	3.16772	2023-09-13 19:41:03.702116-04
2597	dydx	dYdX	dydx	1.93	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339585779	2.24608	2023-09-13 19:41:03.70323-04
2598	terra-luna	Terra Luna Classic	lunc	5.797e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	337830346	1.2079	2023-09-13 19:41:03.704308-04
2599	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1685.01	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333299610	0.82184	2023-09-13 19:41:03.7054-04
2600	trust-wallet-token	Trust Wallet	twt	0.781973	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	325748944	0.38348	2023-09-13 19:41:03.706573-04
2601	nexo	NEXO	nexo	0.561521	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319612831	-3.26365	2023-09-13 19:41:03.708794-04
2602	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.78916	2023-09-13 19:41:03.710879-04
2603	gemini-dollar	Gemini Dollar	gusd	0.998648	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307432315	0.0439	2023-09-13 19:41:03.712519-04
2604	apenft	APENFT	nft	3.03084e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300125669	0.55505	2023-09-13 19:41:03.714002-04
2605	dash	Dash	dash	25.58	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293192958	0.97174	2023-09-13 19:41:03.715414-04
2606	staked-frax-ether	Staked Frax Ether	sfrxeth	1696.87	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293020562	0.9438	2023-09-13 19:41:03.71676-04
2607	compound-usdt	cUSDT	cusdt	0.02700283	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	286438126	12.29404	2023-09-13 19:41:03.71838-04
2608	gmx	GMX	gmx	31.63	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285154236	0.73926	2023-09-13 19:41:03.71998-04
2609	pepe	Pepe	pepe	6.75921e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284664210	0.11762	2023-09-13 19:41:03.721572-04
2610	liquity-usd	Liquity USD	lusd	0.99552	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282623019	0.00769	2023-09-13 19:41:03.723236-04
2611	astar	Astar	astr	0.053174	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	279480293	-5.55009	2023-09-13 19:41:03.726003-04
2612	woo-network	WOO Network	woo	0.157774	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	276573736	1.85401	2023-09-13 19:41:03.728438-04
2613	zilliqa	Zilliqa	zil	0.01606052	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	273487478	5.79388	2023-09-13 19:41:03.730966-04
2614	compound-governance-token	Compound	comp	39.77	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271924857	8.07629	2023-09-13 19:41:03.732469-04
2615	arweave	Arweave	ar	4.05	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	264418384	1.9246	2023-09-13 19:41:03.734139-04
2616	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:41:03.735744-04
2617	flare-networks	Flare	flr	0.0112552	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263679373	-3.97113	2023-09-13 19:41:03.737238-04
2618	defichain	DeFiChain	dfi	0.351295	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262264593	5.80565	2023-09-13 19:41:03.73852-04
2619	safepal	SafePal	sfp	0.613362	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258541316	5.19304	2023-09-13 19:41:03.739918-04
2620	gnosis	Gnosis	gno	99.44	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257868285	1.42409	2023-09-13 19:41:03.743022-04
2621	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255166280	0.45057	2023-09-13 19:41:03.744835-04
2622	basic-attention-token	Basic Attention	bat	0.166929	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248484484	3.29466	2023-09-13 19:41:03.746163-04
2623	1inch	1inch	1inch	0.23465	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241509344	2.89442	2023-09-13 19:41:03.747405-04
2624	chia	Chia	xch	28.23	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238819815	2.75704	2023-09-13 19:41:03.748761-04
2625	conflux-token	Conflux	cfx	0.113567	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	238408851	0.78576	2023-09-13 19:41:03.749999-04
2626	fetch-ai	Fetch.ai	fet	0.224092	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234216685	-0.48867	2023-09-13 19:41:03.751149-04
2627	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233717071	1.12325	2023-09-13 19:41:03.752231-04
2628	oec-token	OKT Chain	okt	13.05	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233227160	-0.39501	2023-09-13 19:41:03.753368-04
2629	illuvium	Illuvium	ilv	39.88	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232845187	-0.34625	2023-09-13 19:41:03.754398-04
2630	huobi-btc	Huobi BTC	hbtc	25834	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231609712	-0.49862	2023-09-13 19:41:03.755346-04
2631	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.57683	2023-09-13 19:41:03.756752-04
2632	ecomi	ECOMI	omi	0.0008414	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227668840	0.44472	2023-09-13 19:41:03.760624-04
2633	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226963199	-2.11044	2023-09-13 19:41:03.762185-04
2634	enjincoin	Enjin Coin	enj	0.223579	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223266890	-1.19057	2023-09-13 19:41:03.763579-04
2635	singularitynet	SingularityNET	agix	0.179855	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	221706770	3.61481	2023-09-13 19:41:03.764883-04
2636	tether-eurt	Euro Tether	eurt	1.074	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221280020	-0.24936	2023-09-13 19:41:03.766209-04
2637	loopring	Loopring	lrc	0.176821	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220610818	1.36377	2023-09-13 19:41:03.767464-04
2638	nem	NEM	xem	0.02443232	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220179552	1.68681	2023-09-13 19:41:03.768754-04
2639	bitcoin-gold	Bitcoin Gold	btg	13.18	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219534562	0.35585	2023-09-13 19:41:03.770078-04
2640	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219323029	1.61484	2023-09-13 19:41:03.771246-04
2641	celo	Celo	celo	0.42172	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216378052	1.66632	2023-09-13 19:41:03.772473-04
2642	sei-network	Sei	sei	0.119106	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214756415	0.77272	2023-09-13 19:41:03.774361-04
2643	zcash	Zcash	zec	25.34	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205007304	2.09977	2023-09-13 19:41:03.777008-04
2644	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204722126	2.29343	2023-09-13 19:41:03.77981-04
2645	osmosis	Osmosis	osmo	0.325738	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200606024	0.75403	2023-09-13 19:41:03.781768-04
2646	decred	Decred	dcr	12.95	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200561191	2.74217	2023-09-13 19:41:03.783672-04
2647	helium	Helium	hnt	1.38	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	198987858	-2.64802	2023-09-13 19:41:03.785575-04
2648	oasis-network	Oasis Network	rose	0.03922119	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197019075	2.79921	2023-09-13 19:41:03.786988-04
2649	theta-fuel	Theta Fuel	tfuel	0.03083604	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193188936	2.2801	2023-09-13 19:41:03.788341-04
2650	olympus	Olympus	ohm	11.11	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192983931	-0.28792	2023-09-13 19:41:03.789699-04
2651	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192062404	1.0875	2023-09-13 19:41:03.791816-04
2652	bone-shibaswap	Bone ShibaSwap	bone	0.822424	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189294573	-1.48142	2023-09-13 19:41:03.794061-04
2653	holotoken	Holo	hot	0.00105049	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186607630	0.84149	2023-09-13 19:41:03.795835-04
2654	akash-network	Akash Network	akt	0.854926	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186604672	-6.40153	2023-09-13 19:41:03.797365-04
2655	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	185703276	1.24043	2023-09-13 19:41:03.798996-04
2656	just	JUST	jst	0.02079091	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184804599	1.97394	2023-09-13 19:41:03.80031-04
2657	aleph-zero	Aleph Zero	azero	0.763287	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184238612	-2.16528	2023-09-13 19:41:03.801664-04
2658	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:41:03.802876-04
2659	ankr	Ankr Network	ankr	0.01821735	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182328053	3.91161	2023-09-13 19:41:03.80405-04
2660	beldex	Beldex	bdx	0.03174738	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177283882	-0.24484	2023-09-13 19:41:03.805178-04
2661	wemix-token	WEMIX	wemix	0.558705	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177169270	-0.98231	2023-09-13 19:41:03.806271-04
2662	yearn-finance	yearn.finance	yfi	5309.44	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175420294	2.28508	2023-09-13 19:41:03.808078-04
2663	livepeer	Livepeer	lpt	6.01	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174684645	0.85332	2023-09-13 19:41:03.810283-04
2664	ravencoin	Ravencoin	rvn	0.01458924	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173750113	0.9944	2023-09-13 19:41:03.811524-04
2665	stepn	STEPN	gmt	0.145236	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172543286	0.4964	2023-09-13 19:41:03.812761-04
2666	aelf	aelf	elf	0.371145	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	171220291	7.17895	2023-09-13 19:41:03.813845-04
2667	golem	Golem	glm	0.166256	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	167749828	2.39621	2023-09-13 19:41:03.815115-04
2668	alchemix-usd	Alchemix USD	alusd	0.991492	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167496334	-0.1635	2023-09-13 19:41:03.816268-04
2669	jasmycoin	JasmyCoin	jasmy	0.00343927	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166375377	-1.04268	2023-09-13 19:41:03.817313-04
2670	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	165773790	-0.90744	2023-09-13 19:41:03.818248-04
2671	audius	Audius	audio	0.146075	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162750360	1.64451	2023-09-13 19:41:03.819375-04
2672	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.04565	2023-09-13 19:41:03.820335-04
2673	kusama	Kusama	ksm	17.98	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161536406	0.87481	2023-09-13 19:41:03.821259-04
2674	blur	Blur	blur	0.173544	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159728393	1.97914	2023-09-13 19:41:03.822236-04
2675	floki	FLOKI	floki	1.598e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	158978830	1.40348	2023-09-13 19:41:03.823314-04
2676	baby-doge-coin	Baby Doge Coin	babydoge	1.02e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	158701597	-1.89094	2023-09-13 19:41:03.824848-04
2677	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	154955562	1.47102	2023-09-13 19:41:03.827272-04
2678	icon	ICON	icx	0.158942	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154417921	2.85068	2023-09-13 19:41:03.828891-04
2679	link	FINSCHIA	fnsa	20.86	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	149363645	0.07123	2023-09-13 19:41:03.830378-04
2680	iotex	IoTeX	iotx	0.01570097	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148659518	2.28035	2023-09-13 19:41:03.832121-04
2681	terra-luna-2	Terra	luna	0.391167	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146146963	0.03207	2023-09-13 19:41:03.833342-04
2682	swipe	SXP	sxp	0.252518	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146063650	3.07334	2023-09-13 19:41:03.834431-04
2683	dao-maker	DAO Maker	dao	0.74084	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141620977	0.72451	2023-09-13 19:41:03.835419-04
2684	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141120131	-0.29697	2023-09-13 19:41:03.836372-04
2685	siacoin	Siacoin	sc	0.00273991	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141031449	1.03218	2023-09-13 19:41:03.837385-04
2686	ontology	Ontology	ont	0.15701	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140196210	3.03171	2023-09-13 19:41:03.838521-04
2687	balancer	Balancer	bal	3.21	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138642503	0.41224	2023-09-13 19:41:03.839506-04
2688	ribbon-finance	Ribbon Finance	rbn	0.175511	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138326583	-2.97365	2023-09-13 19:41:03.841465-04
2689	ocean-protocol	Ocean Protocol	ocean	0.312536	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135707810	0.61949	2023-09-13 19:41:03.844442-04
2690	seth2	sETH2	seth2	1594.76	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135528961	0.81855	2023-09-13 19:41:03.846597-04
2691	axelar	Axelar	axl	0.341119	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135329896	-1.70558	2023-09-13 19:41:03.848793-04
2692	band-protocol	Band Protocol	band	0.995506	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133696207	1.71877	2023-09-13 19:41:03.850644-04
2693	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133149577	0.07578	2023-09-13 19:41:03.851982-04
2694	worldcoin-wld	Worldcoin	wld	1.012	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	131583436	-0.3795	2023-09-13 19:41:03.853329-04
2695	open-exchange-token	Open Exchange Token	ox	0.03377755	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	131511105	18.94149	2023-09-13 19:41:03.854621-04
2696	biconomy	Biconomy	bico	0.199265	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131215798	0.97857	2023-09-13 19:41:03.855842-04
2697	iostoken	IOST	iost	0.00686739	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128560963	1.65269	2023-09-13 19:41:03.858242-04
2698	kadena	Kadena	kda	0.520626	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127869920	0.9425	2023-09-13 19:41:03.860334-04
2699	wax	WAX	waxp	0.03765648	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126416637	2.06523	2023-09-13 19:41:03.862159-04
2700	merit-circle	Merit Circle	mc	0.262892	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121682317	-1.24856	2023-09-13 19:41:03.863832-04
2701	moonbeam	Moonbeam	glmr	0.165284	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121645886	-0.66621	2023-09-13 19:41:03.865108-04
2702	ronin	Ronin	ron	0.477537	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120940858	0.03527	2023-09-13 19:41:03.866365-04
2703	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.51884	2023-09-13 19:41:03.867533-04
2704	tomochain	TomoChain	tomo	1.24	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119623865	2.42955	2023-09-13 19:41:03.868677-04
2705	terrausd	TerraClassicUSD	ustc	0.01210101	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118536169	-0.24502	2023-09-13 19:41:03.869932-04
2706	sushi	Sushi	sushi	0.613366	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118033261	5.54935	2023-09-13 19:41:03.871283-04
2707	swissborg	SwissBorg	chsb	0.123234	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117194870	0.77592	2023-09-13 19:41:03.872689-04
2708	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26196	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	115935871	1.14949	2023-09-13 19:41:03.874708-04
2709	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1634.02	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115753041	0.93659	2023-09-13 19:41:03.876581-04
2710	harmony	Harmony	one	0.00939736	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115631045	1.48683	2023-09-13 19:41:03.878558-04
2711	tribe-2	Tribe	tribe	0.253172	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	115182923	-1.35157	2023-09-13 19:41:03.879926-04
2712	crvusd	crvUSD	crvusd	0.995487	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111440159	-0.15859	2023-09-13 19:41:03.881231-04
2713	skale	SKALE	skl	0.02360649	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110855130	7.83892	2023-09-13 19:41:03.882273-04
2714	bora	BORA	bora	0.111674	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	110452358	1.10534	2023-09-13 19:41:03.883482-04
2715	magic	Magic	magic	0.466553	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110396092	6.69169	2023-09-13 19:41:03.884626-04
2716	polymath	Polymath	poly	0.120666	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108798923	-0.51126	2023-09-13 19:41:03.885888-04
2717	ssv-network	SSV Network	ssv	15.21	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	107840085	1.87134	2023-09-13 19:41:03.887179-04
2718	digibyte	DigiByte	dgb	0.00644901	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106647709	3.54741	2023-09-13 19:41:03.88834-04
2719	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104403383	0.81528	2023-09-13 19:41:03.889601-04
2720	hive	Hive	hive	0.276626	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102625908	2.82052	2023-09-13 19:41:03.891625-04
2721	zelcash	Flux	flux	0.322388	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102511016	1.06763	2023-09-13 19:41:03.893935-04
2722	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.33017	2023-09-13 19:41:03.895556-04
2723	lisk	Lisk	lsk	0.706202	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	100879686	3.90925	2023-09-13 19:41:03.896879-04
2724	vethor-token	VeThor	vtho	0.00148642	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99946114	45.99845	2023-09-13 19:41:03.898287-04
2725	api3	API3	api3	1.05	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99908262	3.27427	2023-09-13 19:41:03.899486-04
2726	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	98998008	1.25126	2023-09-13 19:41:03.900561-04
2727	zencash	Horizen	zen	7.01	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98821943	2.28206	2023-09-13 19:41:03.901692-04
2728	echelon-prime	Echelon Prime	prime	4.25	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98408273	2.05953	2023-09-13 19:41:03.902878-04
2729	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97220525	6.5655	2023-09-13 19:41:03.90393-04
2730	msol	Marinade staked SOL	msol	20.87	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97152743	2.50724	2023-09-13 19:41:03.905108-04
2731	metal	Metal DAO	mtl	1.48	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96754377	9.60698	2023-09-13 19:41:03.906377-04
2732	amp-token	Amp	amp	0.0017057	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95726102	-0.83429	2023-09-13 19:41:03.908447-04
2733	kyber-network-crystal	Kyber Network Crystal	knc	0.516275	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94019470	2.50386	2023-09-13 19:41:03.910502-04
2734	reserve-rights-token	Reserve Rights	rsr	0.0018511	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93806949	6.12691	2023-09-13 19:41:03.912755-04
2735	everscale	Everscale	ever	0.051759	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93380641	-3.00997	2023-09-13 19:41:03.914585-04
2736	cartesi	Cartesi	ctsi	0.126799	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93277221	7.2633	2023-09-13 19:41:03.915868-04
2737	stargate-finance	Stargate Finance	stg	0.451745	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92363689	-0.0236	2023-09-13 19:41:03.91714-04
2738	blox	Blox	cdt	0.132197	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	-15.34354	2023-09-13 19:41:03.91846-04
2739	bitkub-coin	Bitkub Coin	kub	1.022	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90384512	1.13995	2023-09-13 19:41:03.91973-04
2740	krypton-dao	Krypton DAO	krd	0.875493	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89710640	-3.1995	2023-09-13 19:41:03.921058-04
2741	deso	Decentralized Social	deso	8.49	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89499288	-1.24685	2023-09-13 19:41:03.922461-04
2742	polymesh	Polymesh	polyx	0.104763	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89196987	1.75353	2023-09-13 19:41:03.92445-04
2743	nervos-network	Nervos Network	ckb	0.00267092	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89160373	2.06263	2023-09-13 19:41:03.927236-04
2744	e-radix	e-Radix	exrd	0.057416	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86992980	0.86011	2023-09-13 19:41:03.929507-04
2745	lukso-token	LUKSO [OLD]	lyxe	5.63	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86452513	-0.39868	2023-09-13 19:41:03.931711-04
2746	stp-network	STP	stpt	0.0440599	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85670408	3.84697	2023-09-13 19:41:03.933296-04
2747	status	Status	snt	0.0215402	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85343693	1.30878	2023-09-13 19:41:03.934703-04
2748	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83715138	-0.47388	2023-09-13 19:41:03.936022-04
2749	pundi-x-2	Pundi X	pundix	0.323796	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83661144	2.6402	2023-09-13 19:41:03.937408-04
2750	joe	JOE	joe	0.244316	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83536454	1.04247	2023-09-13 19:41:03.938806-04
2751	bitcoin	Bitcoin	btc	26219	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	510794285088	1.2624	2023-09-13 19:41:16.438284-04
2752	ethereum	Ethereum	eth	1607.07	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193179886199	0.70139	2023-09-13 19:41:16.43987-04
2753	tether	Tether	usdt	1	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83032353215	0.00039	2023-09-13 19:41:16.441493-04
2754	binancecoin	BNB	bnb	212.49	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32702625508	0.44318	2023-09-13 19:41:16.443391-04
2755	usd-coin	USD Coin	usdc	1	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26217460340	-0.08511	2023-09-13 19:41:16.444792-04
2756	ripple	XRP	xrp	0.483916	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25696224427	0.74139	2023-09-13 19:41:16.44603-04
2757	staked-ether	Lido Staked Ether	steth	1607.15	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13866589374	0.86219	2023-09-13 19:41:16.447254-04
2758	cardano	Cardano	ada	0.248726	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8717575138	1.05165	2023-09-13 19:41:16.448891-04
2759	dogecoin	Dogecoin	doge	0.061243	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8636343453	0.46391	2023-09-13 19:41:16.450229-04
2760	solana	Solana	sol	18.37	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7549519877	2.31575	2023-09-13 19:41:16.451561-04
2761	tron	TRON	trx	0.081129	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7230952566	0.45764	2023-09-13 19:41:16.452724-04
2762	the-open-network	Toncoin	ton	1.9	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6523964902	4.9462	2023-09-13 19:41:16.453865-04
2763	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5100462135	0.2443	2023-09-13 19:41:16.455306-04
2764	matic-network	Polygon	matic	0.513637	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4787522417	1.25565	2023-09-13 19:41:16.456896-04
2765	litecoin	Litecoin	ltc	61.96	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4564833246	3.16749	2023-09-13 19:41:16.458114-04
2766	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4277195516	0.94506	2023-09-13 19:41:16.459176-04
2767	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26239	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4273031657	1.37438	2023-09-13 19:41:16.460574-04
2768	bitcoin-cash	Bitcoin Cash	bch	199.81	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3897743223	0.14968	2023-09-13 19:41:16.462069-04
2769	dai	Dai	dai	0.998437	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3836125753	-0.05917	2023-09-13 19:41:16.464414-04
2770	leo-token	LEO Token	leo	3.64	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3388563371	-0.53458	2023-09-13 19:41:16.465836-04
2771	stellar	Stellar	xlm	0.12063	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3316967523	-0.67243	2023-09-13 19:41:16.466845-04
2772	avalanche-2	Avalanche	avax	9.3	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3292799785	0.81456	2023-09-13 19:41:16.46793-04
2773	chainlink	Chainlink	link	6.02	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3235966194	0.83787	2023-09-13 19:41:16.46922-04
2774	uniswap	Uniswap	uni	4.25	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3206400424	1.06407	2023-09-13 19:41:16.470706-04
2775	true-usd	TrueUSD	tusd	0.998935	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3150526214	0.10856	2023-09-13 19:41:16.472286-04
2776	monero	Monero	xmr	143	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2596264211	1.48737	2023-09-13 19:41:16.473807-04
2777	okb	OKB	okb	42.08	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2524520164	1.04595	2023-09-13 19:41:16.476076-04
2778	binance-usd	Binance USD	busd	0.999979	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515062438	0.06781	2023-09-13 19:41:16.477736-04
2779	ethereum-classic	Ethereum Classic	etc	15.14	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2165371512	0.97409	2023-09-13 19:41:16.47913-04
2780	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1913131414	2.4562	2023-09-13 19:41:16.480473-04
2781	hedera-hashgraph	Hedera	hbar	0.04975554	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1650430331	5.93166	2023-09-13 19:41:16.481944-04
2782	filecoin	Filecoin	fil	3.17	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1418489041	2.74375	2023-09-13 19:41:16.483373-04
2783	quant-network	Quant	qnt	92.7	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1346237101	-0.14584	2023-09-13 19:41:16.484686-04
2784	crypto-com-chain	Cronos	cro	0.050504	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326768727	0.60479	2023-09-13 19:41:16.485965-04
2785	lido-dao	Lido DAO	ldo	1.48	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1320952818	1.29246	2023-09-13 19:41:16.487185-04
2786	mantle	Mantle	mnt	0.407266	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316998530	-0.02118	2023-09-13 19:41:16.488203-04
2787	internet-computer	Internet Computer	icp	2.93	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1302204464	-0.26786	2023-09-13 19:41:16.489385-04
2788	aptos	Aptos	apt	5.19	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1222684515	2.80619	2023-09-13 19:41:16.491342-04
2789	vechain	VeChain	vet	0.01659505	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1204937070	0.96764	2023-09-13 19:41:16.493382-04
2790	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1081553520	0.96212	2023-09-13 19:41:16.494724-04
2791	maker	Maker	mkr	1156.28	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1042240940	3.04249	2023-09-13 19:41:16.496082-04
2792	near	NEAR Protocol	near	1.089	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1024336784	1.85062	2023-09-13 19:41:16.497355-04
2793	kaspa	Kaspa	kas	0.04956214	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1007111596	16.65332	2023-09-13 19:41:16.49849-04
2794	arbitrum	Arbitrum	arb	0.786422	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002416619	-0.10039	2023-09-13 19:41:16.499653-04
2795	rocket-pool-eth	Rocket Pool ETH	reth	1742.3	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	914993469	0.7369	2023-09-13 19:41:16.50068-04
2796	aave	Aave	aave	53.65	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	779878959	1.08496	2023-09-13 19:41:16.501915-04
2797	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	761182298	0.10112	2023-09-13 19:41:16.502883-04
2798	the-graph	The Graph	grt	0.082397	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	757544152	3.61197	2023-09-13 19:41:16.504123-04
2799	usdd	USDD	usdd	0.998357	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724218844	0.0344	2023-09-13 19:41:16.505321-04
2800	xdce-crowd-sale	XDC Network	xdc	0.052093	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	722632291	-1.47472	2023-09-13 19:41:16.507087-04
2801	algorand	Algorand	algo	0.090899	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	711687052	1.50618	2023-09-13 19:41:16.508705-04
2802	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	675226525	2.69968	2023-09-13 19:41:16.509959-04
2803	frax	Frax	frax	0.994948	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669022378	-0.00966	2023-09-13 19:41:16.511394-04
2804	blockstack	Stacks	stx	0.458808	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	645624346	3.88264	2023-09-13 19:41:16.512499-04
2805	eos	EOS	eos	0.554697	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621471719	1.27062	2023-09-13 19:41:16.513492-04
2806	bitget-token	Bitget Token	bgb	0.4405	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617377868	-0.1044	2023-09-13 19:41:16.514617-04
2807	elrond-erd-2	MultiversX	egld	23.52	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	609909828	2.64478	2023-09-13 19:41:16.515634-04
2808	tezos	Tezos	xtz	0.644133	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	608718029	1.33972	2023-09-13 19:41:16.516683-04
2809	the-sandbox	The Sandbox	sand	0.290102	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	599858726	2.54983	2023-09-13 19:41:16.517907-04
2810	bitcoin-cash-sv	Bitcoin SV	bsv	30.81	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593379059	-0.56523	2023-09-13 19:41:16.519378-04
2811	theta-token	Theta Network	theta	0.591312	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	591674047	1.59562	2023-09-13 19:41:16.520662-04
2812	radix	Radix	xrd	0.05683	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	583106717	-0.35587	2023-09-13 19:41:16.521768-04
2813	injective-protocol	Injective	inj	6.92	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	578643103	1.60636	2023-09-13 19:41:16.522876-04
2814	immutable-x	ImmutableX	imx	0.492961	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576279209	1.53628	2023-09-13 19:41:16.524854-04
2815	render-token	Render	rndr	1.52	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	566384324	1.03754	2023-09-13 19:41:16.527015-04
2816	axie-infinity	Axie Infinity	axs	4.25	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	557937336	1.4358	2023-09-13 19:41:16.52864-04
2817	fantom	Fantom	ftm	0.1915	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	537293246	2.24872	2023-09-13 19:41:16.530113-04
2818	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529550508	0.01762	2023-09-13 19:41:16.531615-04
2819	paxos-standard	Pax Dollar	usdp	0.999593	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517152265	-0.03928	2023-09-13 19:41:16.532912-04
2820	decentraland	Decentraland	mana	0.279927	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516065574	3.75214	2023-09-13 19:41:16.533936-04
2821	neo	NEO	neo	7.29	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	513345381	3.33682	2023-09-13 19:41:16.534949-04
2822	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	481661765	7.56488	2023-09-13 19:41:16.535907-04
2823	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:41:16.536923-04
2824	kava	Kava	kava	0.618775	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472732957	1.74725	2023-09-13 19:41:16.538291-04
2825	tether-gold	Tether Gold	xaut	1909.27	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470734170	-0.12103	2023-09-13 19:41:16.539433-04
2826	pax-gold	PAX Gold	paxg	1888.65	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	469027852	-0.1326	2023-09-13 19:41:16.541112-04
2827	iota	IOTA	miota	0.168413	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	467972757	4.45671	2023-09-13 19:41:16.542316-04
2828	rollbit-coin	Rollbit Coin	rlb	0.142315	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	467542095	-4.26177	2023-09-13 19:41:16.543363-04
2829	ecash	eCash	xec	2.299e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	447213263	1.81173	2023-09-13 19:41:16.544715-04
2830	rocket-pool	Rocket Pool	rpl	21.9	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	435497469	-0.87439	2023-09-13 19:41:16.54577-04
2831	flow	Flow	flow	0.418238	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433082851	2.43828	2023-09-13 19:41:16.547035-04
2832	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423225104	1.38359	2023-09-13 19:41:16.548123-04
2833	frax-ether	Frax Ether	frxeth	1604.54	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415636884	0.8182	2023-09-13 19:41:16.549186-04
2834	tokenize-xchange	Tokenize Xchange	tkx	5.17	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414559015	0.51018	2023-09-13 19:41:16.550434-04
2835	kucoin-shares	KuCoin	kcs	4.25	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	409928467	2.62734	2023-09-13 19:41:16.551508-04
2836	chiliz	Chiliz	chz	0.056408	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393877629	1.09901	2023-09-13 19:41:16.552732-04
2837	first-digital-usd	First Digital USD	fdusd	0.999836	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393104054	-0.02836	2023-09-13 19:41:16.553719-04
2838	frax-share	Frax Share	fxs	5.31	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	391261031	3.95509	2023-09-13 19:41:16.554873-04
2839	klay-token	Klaytn	klay	0.121227	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	386068947	-2.02741	2023-09-13 19:41:16.556118-04
2840	huobi-token	Huobi	ht	2.36	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376966402	0.77631	2023-09-13 19:41:16.558044-04
2841	casper-network	Casper Network	cspr	0.03266534	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	370094928	0.03758	2023-09-13 19:41:16.559282-04
2842	bittorrent	BitTorrent	btt	3.87981e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368825542	0.38569	2023-09-13 19:41:16.560564-04
2843	gala	GALA	gala	0.01410624	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368665086	1.32258	2023-09-13 19:41:16.561669-04
2844	curve-dao-token	Curve DAO	crv	0.416262	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365249897	3.74027	2023-09-13 19:41:16.562753-04
2845	mina-protocol	Mina Protocol	mina	0.374297	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362975972	1.49887	2023-09-13 19:41:16.563736-04
2846	sui	Sui	sui	0.441456	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	349471306	3.16772	2023-09-13 19:41:16.564776-04
2847	dydx	dYdX	dydx	1.93	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339585779	2.24608	2023-09-13 19:41:16.565755-04
2848	terra-luna	Terra Luna Classic	lunc	5.797e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	337830346	1.2079	2023-09-13 19:41:16.566841-04
2849	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1685.01	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333299610	0.82184	2023-09-13 19:41:16.567935-04
2850	trust-wallet-token	Trust Wallet	twt	0.781973	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	325748944	0.38348	2023-09-13 19:41:16.569019-04
2851	nexo	NEXO	nexo	0.561521	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319612831	-3.26365	2023-09-13 19:41:16.570228-04
2852	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.78916	2023-09-13 19:41:16.571356-04
2853	gemini-dollar	Gemini Dollar	gusd	0.998648	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307432315	0.0439	2023-09-13 19:41:16.572553-04
2854	apenft	APENFT	nft	3.03084e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300125669	0.55505	2023-09-13 19:41:16.573845-04
2855	dash	Dash	dash	25.58	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293192958	0.97174	2023-09-13 19:41:16.575132-04
2856	staked-frax-ether	Staked Frax Ether	sfrxeth	1696.87	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293020562	0.9438	2023-09-13 19:41:16.576544-04
2857	compound-usdt	cUSDT	cusdt	0.02700283	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	286438126	12.29404	2023-09-13 19:41:16.577895-04
2858	gmx	GMX	gmx	31.63	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285154236	0.73926	2023-09-13 19:41:16.579106-04
2859	pepe	Pepe	pepe	6.75921e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284664210	0.11762	2023-09-13 19:41:16.580267-04
2860	liquity-usd	Liquity USD	lusd	0.99552	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282623019	0.00769	2023-09-13 19:41:16.581307-04
2861	astar	Astar	astr	0.053174	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	279480293	-5.55009	2023-09-13 19:41:16.582425-04
2862	woo-network	WOO Network	woo	0.157774	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	276573736	1.85401	2023-09-13 19:41:16.583985-04
2863	zilliqa	Zilliqa	zil	0.01606052	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	273487478	5.79388	2023-09-13 19:41:16.585511-04
2864	compound-governance-token	Compound	comp	39.77	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271924857	8.07629	2023-09-13 19:41:16.587-04
2865	arweave	Arweave	ar	4.05	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	264418384	1.9246	2023-09-13 19:41:16.588482-04
2866	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:41:16.589733-04
2867	flare-networks	Flare	flr	0.0112552	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263679373	-3.97113	2023-09-13 19:41:16.59132-04
2868	defichain	DeFiChain	dfi	0.351295	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262264593	5.80565	2023-09-13 19:41:16.592507-04
2869	safepal	SafePal	sfp	0.613362	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258541316	5.19304	2023-09-13 19:41:16.593547-04
2870	gnosis	Gnosis	gno	99.44	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257868285	1.42409	2023-09-13 19:41:16.594687-04
2871	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255166280	0.45057	2023-09-13 19:41:16.595763-04
2872	basic-attention-token	Basic Attention	bat	0.166929	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248484484	3.29466	2023-09-13 19:41:16.596742-04
2873	1inch	1inch	1inch	0.23465	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241509344	2.89442	2023-09-13 19:41:16.597812-04
2874	chia	Chia	xch	28.23	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238819815	2.75704	2023-09-13 19:41:16.598891-04
2875	conflux-token	Conflux	cfx	0.113567	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	238408851	0.78576	2023-09-13 19:41:16.599964-04
2876	fetch-ai	Fetch.ai	fet	0.224092	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234216685	-0.48867	2023-09-13 19:41:16.601065-04
2877	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233717071	1.12325	2023-09-13 19:41:16.60207-04
2878	oec-token	OKT Chain	okt	13.05	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233227160	-0.39501	2023-09-13 19:41:16.603271-04
2879	illuvium	Illuvium	ilv	39.88	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232845187	-0.34625	2023-09-13 19:41:16.604724-04
2880	huobi-btc	Huobi BTC	hbtc	25834	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231609712	-0.49862	2023-09-13 19:41:16.606083-04
2881	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.57683	2023-09-13 19:41:16.607987-04
2882	ecomi	ECOMI	omi	0.0008414	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227668840	0.44472	2023-09-13 19:41:16.609931-04
2883	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226963199	-2.11044	2023-09-13 19:41:16.6113-04
2884	enjincoin	Enjin Coin	enj	0.223579	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223266890	-1.19057	2023-09-13 19:41:16.612466-04
2885	singularitynet	SingularityNET	agix	0.179855	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	221706770	3.61481	2023-09-13 19:41:16.613875-04
2886	tether-eurt	Euro Tether	eurt	1.074	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221280020	-0.24936	2023-09-13 19:41:16.615189-04
2887	loopring	Loopring	lrc	0.176821	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220610818	1.36377	2023-09-13 19:41:16.616533-04
2888	nem	NEM	xem	0.02443232	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220179552	1.68681	2023-09-13 19:41:16.61795-04
2889	bitcoin-gold	Bitcoin Gold	btg	13.18	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219534562	0.35585	2023-09-13 19:41:16.619465-04
2890	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219323029	1.61484	2023-09-13 19:41:16.620787-04
2891	celo	Celo	celo	0.42172	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216378052	1.66632	2023-09-13 19:41:16.622057-04
2892	sei-network	Sei	sei	0.119106	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214756415	0.77272	2023-09-13 19:41:16.623447-04
2893	zcash	Zcash	zec	25.34	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205007304	2.09977	2023-09-13 19:41:16.625317-04
2894	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204722126	2.29343	2023-09-13 19:41:16.627303-04
2895	osmosis	Osmosis	osmo	0.325738	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200606024	0.75403	2023-09-13 19:41:16.629083-04
2896	decred	Decred	dcr	12.95	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200561191	2.74217	2023-09-13 19:41:16.630539-04
2897	helium	Helium	hnt	1.38	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	198987858	-2.64802	2023-09-13 19:41:16.631982-04
2898	oasis-network	Oasis Network	rose	0.03922119	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197019075	2.79921	2023-09-13 19:41:16.633301-04
2899	theta-fuel	Theta Fuel	tfuel	0.03083604	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193188936	2.2801	2023-09-13 19:41:16.634705-04
2900	olympus	Olympus	ohm	11.11	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192983931	-0.28792	2023-09-13 19:41:16.635926-04
2901	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192062404	1.0875	2023-09-13 19:41:16.637155-04
2902	bone-shibaswap	Bone ShibaSwap	bone	0.822424	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189294573	-1.48142	2023-09-13 19:41:16.638336-04
2903	holotoken	Holo	hot	0.00105049	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186607630	0.84149	2023-09-13 19:41:16.639733-04
2904	akash-network	Akash Network	akt	0.854926	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186604672	-6.40153	2023-09-13 19:41:16.641048-04
2905	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	185703276	1.24043	2023-09-13 19:41:16.642204-04
2906	just	JUST	jst	0.02079091	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184804599	1.97394	2023-09-13 19:41:16.643227-04
2907	aleph-zero	Aleph Zero	azero	0.763287	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184238612	-2.16528	2023-09-13 19:41:16.644343-04
2908	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:41:16.645431-04
2909	ankr	Ankr Network	ankr	0.01821735	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182328053	3.91161	2023-09-13 19:41:16.646935-04
2910	beldex	Beldex	bdx	0.03174738	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177283882	-0.24484	2023-09-13 19:41:16.64851-04
2911	wemix-token	WEMIX	wemix	0.558705	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177169270	-0.98231	2023-09-13 19:41:16.64983-04
2912	yearn-finance	yearn.finance	yfi	5309.44	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175420294	2.28508	2023-09-13 19:41:16.651299-04
2913	livepeer	Livepeer	lpt	6.01	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174684645	0.85332	2023-09-13 19:41:16.652324-04
2914	ravencoin	Ravencoin	rvn	0.01458924	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173750113	0.9944	2023-09-13 19:41:16.653463-04
2915	stepn	STEPN	gmt	0.145236	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172543286	0.4964	2023-09-13 19:41:16.654601-04
2916	aelf	aelf	elf	0.371145	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	171220291	7.17895	2023-09-13 19:41:16.655684-04
2917	golem	Golem	glm	0.166256	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	167749828	2.39621	2023-09-13 19:41:16.657278-04
2918	alchemix-usd	Alchemix USD	alusd	0.991492	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167496334	-0.1635	2023-09-13 19:41:16.659148-04
2919	jasmycoin	JasmyCoin	jasmy	0.00343927	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166375377	-1.04268	2023-09-13 19:41:16.660612-04
2920	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	165773790	-0.90744	2023-09-13 19:41:16.661997-04
2921	audius	Audius	audio	0.146075	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162750360	1.64451	2023-09-13 19:41:16.663293-04
2922	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.04565	2023-09-13 19:41:16.664524-04
2923	kusama	Kusama	ksm	17.98	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161536406	0.87481	2023-09-13 19:41:16.665773-04
2924	blur	Blur	blur	0.173544	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159728393	1.97914	2023-09-13 19:41:16.666882-04
2925	floki	FLOKI	floki	1.598e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	158978830	1.40348	2023-09-13 19:41:16.668011-04
2926	baby-doge-coin	Baby Doge Coin	babydoge	1.02e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	158701597	-1.89094	2023-09-13 19:41:16.668926-04
2927	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	154955562	1.47102	2023-09-13 19:41:16.669849-04
2928	icon	ICON	icx	0.158942	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154417921	2.85068	2023-09-13 19:41:16.67102-04
2929	link	FINSCHIA	fnsa	20.86	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	149363645	0.07123	2023-09-13 19:41:16.672745-04
2930	iotex	IoTeX	iotx	0.01570097	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148659518	2.28035	2023-09-13 19:41:16.674641-04
2931	terra-luna-2	Terra	luna	0.391167	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146146963	0.03207	2023-09-13 19:41:16.676384-04
2932	swipe	SXP	sxp	0.252518	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146063650	3.07334	2023-09-13 19:41:16.678531-04
2933	dao-maker	DAO Maker	dao	0.74084	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141620977	0.72451	2023-09-13 19:41:16.681966-04
2934	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141120131	-0.29697	2023-09-13 19:41:16.683552-04
2935	siacoin	Siacoin	sc	0.00273991	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141031449	1.03218	2023-09-13 19:41:16.684981-04
2936	ontology	Ontology	ont	0.15701	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140196210	3.03171	2023-09-13 19:41:16.686387-04
2937	balancer	Balancer	bal	3.21	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138642503	0.41224	2023-09-13 19:41:16.68789-04
2938	ribbon-finance	Ribbon Finance	rbn	0.175511	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138326583	-2.97365	2023-09-13 19:41:16.689234-04
2939	ocean-protocol	Ocean Protocol	ocean	0.312536	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135707810	0.61949	2023-09-13 19:41:16.690861-04
2940	seth2	sETH2	seth2	1594.76	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135528961	0.81855	2023-09-13 19:41:16.692687-04
2941	axelar	Axelar	axl	0.341119	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135329896	-1.70558	2023-09-13 19:41:16.694093-04
2942	band-protocol	Band Protocol	band	0.995506	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133696207	1.71877	2023-09-13 19:41:16.695379-04
2943	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133149577	0.07578	2023-09-13 19:41:16.696707-04
2944	worldcoin-wld	Worldcoin	wld	1.012	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	131583436	-0.3795	2023-09-13 19:41:16.69801-04
2945	open-exchange-token	Open Exchange Token	ox	0.03377755	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	131511105	18.94149	2023-09-13 19:41:16.699349-04
2946	biconomy	Biconomy	bico	0.199265	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131215798	0.97857	2023-09-13 19:41:16.700646-04
2947	iostoken	IOST	iost	0.00686739	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128560963	1.65269	2023-09-13 19:41:16.701885-04
2948	kadena	Kadena	kda	0.520626	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127869920	0.9425	2023-09-13 19:41:16.703642-04
2949	wax	WAX	waxp	0.03765648	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126416637	2.06523	2023-09-13 19:41:16.715213-04
2950	merit-circle	Merit Circle	mc	0.262892	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121682317	-1.24856	2023-09-13 19:41:16.717573-04
2951	moonbeam	Moonbeam	glmr	0.165284	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121645886	-0.66621	2023-09-13 19:41:16.719237-04
2952	ronin	Ronin	ron	0.477537	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120940858	0.03527	2023-09-13 19:41:16.720874-04
2953	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.51884	2023-09-13 19:41:16.722184-04
2954	tomochain	TomoChain	tomo	1.24	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119623865	2.42955	2023-09-13 19:41:16.723396-04
2955	terrausd	TerraClassicUSD	ustc	0.01210101	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118536169	-0.24502	2023-09-13 19:41:16.724956-04
2956	sushi	Sushi	sushi	0.613366	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118033261	5.54935	2023-09-13 19:41:16.72722-04
2957	swissborg	SwissBorg	chsb	0.123234	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117194870	0.77592	2023-09-13 19:41:16.729589-04
2958	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26196	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	115935871	1.14949	2023-09-13 19:41:16.73176-04
2959	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1634.02	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115753041	0.93659	2023-09-13 19:41:16.733657-04
2960	harmony	Harmony	one	0.00939736	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115631045	1.48683	2023-09-13 19:41:16.735324-04
2961	tribe-2	Tribe	tribe	0.253172	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	115182923	-1.35157	2023-09-13 19:41:16.736875-04
2962	crvusd	crvUSD	crvusd	0.995487	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111440159	-0.15859	2023-09-13 19:41:16.738217-04
2963	skale	SKALE	skl	0.02360649	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110855130	7.83892	2023-09-13 19:41:16.739447-04
2964	bora	BORA	bora	0.111674	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	110452358	1.10534	2023-09-13 19:41:16.741565-04
2965	magic	Magic	magic	0.466553	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110396092	6.69169	2023-09-13 19:41:16.743126-04
2966	polymath	Polymath	poly	0.120666	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108798923	-0.51126	2023-09-13 19:41:16.744389-04
2967	ssv-network	SSV Network	ssv	15.21	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	107840085	1.87134	2023-09-13 19:41:16.745693-04
2968	digibyte	DigiByte	dgb	0.00644901	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106647709	3.54741	2023-09-13 19:41:16.747091-04
2969	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104403383	0.81528	2023-09-13 19:41:16.748311-04
2970	hive	Hive	hive	0.276626	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102625908	2.82052	2023-09-13 19:41:16.749533-04
2971	zelcash	Flux	flux	0.322388	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102511016	1.06763	2023-09-13 19:41:16.750908-04
2972	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.33017	2023-09-13 19:41:16.752196-04
2973	lisk	Lisk	lsk	0.706202	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	100879686	3.90925	2023-09-13 19:41:16.753572-04
2974	vethor-token	VeThor	vtho	0.00148642	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99946114	45.99845	2023-09-13 19:41:16.754723-04
2975	api3	API3	api3	1.05	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99908262	3.27427	2023-09-13 19:41:16.755872-04
2976	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	98998008	1.25126	2023-09-13 19:41:16.757129-04
2977	zencash	Horizen	zen	7.01	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98821943	2.28206	2023-09-13 19:41:16.759935-04
2978	echelon-prime	Echelon Prime	prime	4.25	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98408273	2.05953	2023-09-13 19:41:16.762944-04
2979	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97220525	6.5655	2023-09-13 19:41:16.765132-04
2980	msol	Marinade staked SOL	msol	20.87	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97152743	2.50724	2023-09-13 19:41:16.766848-04
2981	metal	Metal DAO	mtl	1.48	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96754377	9.60698	2023-09-13 19:41:16.768185-04
2982	amp-token	Amp	amp	0.0017057	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95726102	-0.83429	2023-09-13 19:41:16.769309-04
2983	kyber-network-crystal	Kyber Network Crystal	knc	0.516275	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94019470	2.50386	2023-09-13 19:41:16.770555-04
2984	reserve-rights-token	Reserve Rights	rsr	0.0018511	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93806949	6.12691	2023-09-13 19:41:16.771612-04
2985	everscale	Everscale	ever	0.051759	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93380641	-3.00997	2023-09-13 19:41:16.772811-04
2986	cartesi	Cartesi	ctsi	0.126799	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93277221	7.2633	2023-09-13 19:41:16.775363-04
2987	stargate-finance	Stargate Finance	stg	0.451745	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92363689	-0.0236	2023-09-13 19:41:16.778615-04
2988	blox	Blox	cdt	0.132197	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	-15.34354	2023-09-13 19:41:16.781688-04
2989	bitkub-coin	Bitkub Coin	kub	1.022	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90384512	1.13995	2023-09-13 19:41:16.783405-04
2990	krypton-dao	Krypton DAO	krd	0.875493	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89710640	-3.1995	2023-09-13 19:41:16.785135-04
2991	deso	Decentralized Social	deso	8.49	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89499288	-1.24685	2023-09-13 19:41:16.786452-04
2992	polymesh	Polymesh	polyx	0.104763	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89196987	1.75353	2023-09-13 19:41:16.787624-04
2993	nervos-network	Nervos Network	ckb	0.00267092	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89160373	2.06263	2023-09-13 19:41:16.788902-04
2994	e-radix	e-Radix	exrd	0.057416	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86992980	0.86011	2023-09-13 19:41:16.790227-04
2995	lukso-token	LUKSO [OLD]	lyxe	5.63	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86452513	-0.39868	2023-09-13 19:41:16.793063-04
2996	stp-network	STP	stpt	0.0440599	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85670408	3.84697	2023-09-13 19:41:16.794919-04
2997	status	Status	snt	0.0215402	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85343693	1.30878	2023-09-13 19:41:16.797499-04
2998	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83715138	-0.47388	2023-09-13 19:41:16.799276-04
2999	pundi-x-2	Pundi X	pundix	0.323796	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83661144	2.6402	2023-09-13 19:41:16.800842-04
3000	joe	JOE	joe	0.244316	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83536454	1.04247	2023-09-13 19:41:16.802064-04
3001	bitcoin	Bitcoin	btc	26219	https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579	510794285088	1.2624	2023-09-13 19:41:22.734735-04
3002	ethereum	Ethereum	eth	1607.07	https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880	193179886199	0.70139	2023-09-13 19:41:22.736143-04
3003	tether	Tether	usdt	1	https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663	83032353215	0.00039	2023-09-13 19:41:22.737302-04
3004	binancecoin	BNB	bnb	212.49	https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850	32702625508	0.44318	2023-09-13 19:41:22.738545-04
3005	usd-coin	USD Coin	usdc	1	https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389	26217460340	-0.08511	2023-09-13 19:41:22.739879-04
3006	ripple	XRP	xrp	0.483916	https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731	25696224427	0.74139	2023-09-13 19:41:22.741872-04
3007	staked-ether	Lido Staked Ether	steth	1607.15	https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546	13866589374	0.86219	2023-09-13 19:41:22.743683-04
3008	cardano	Cardano	ada	0.248726	https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860	8717575138	1.05165	2023-09-13 19:41:22.745498-04
3009	dogecoin	Dogecoin	doge	0.061243	https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256	8636343453	0.46391	2023-09-13 19:41:22.746779-04
3010	solana	Solana	sol	18.37	https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422	7549519877	2.31575	2023-09-13 19:41:22.748136-04
3011	tron	TRON	trx	0.081129	https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066	7230952566	0.45764	2023-09-13 19:41:22.749442-04
3012	the-open-network	Toncoin	ton	1.9	https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png?1670498136	6523964902	4.9462	2023-09-13 19:41:22.750857-04
3013	polkadot	Polkadot	dot	4	https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644	5100462135	0.2443	2023-09-13 19:41:22.752029-04
3014	matic-network	Polygon	matic	0.513637	https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912	4787522417	1.25565	2023-09-13 19:41:22.753222-04
3015	litecoin	Litecoin	ltc	61.96	https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580	4564833246	3.16749	2023-09-13 19:41:22.754388-04
3016	shiba-inu	Shiba Inu	shib	7.26e-06	https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446	4277195516	0.94506	2023-09-13 19:41:22.755449-04
3017	wrapped-bitcoin	Wrapped Bitcoin	wbtc	26239	https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744	4273031657	1.37438	2023-09-13 19:41:22.756715-04
3018	bitcoin-cash	Bitcoin Cash	bch	199.81	https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492	3897743223	0.14968	2023-09-13 19:41:22.758889-04
3019	dai	Dai	dai	0.998437	https://assets.coingecko.com/coins/images/9956/large/Badge_Dai.png?1687143508	3836125753	-0.05917	2023-09-13 19:41:22.760701-04
3020	leo-token	LEO Token	leo	3.64	https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215	3388563371	-0.53458	2023-09-13 19:41:22.762423-04
3021	stellar	Stellar	xlm	0.12063	https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157	3316967523	-0.67243	2023-09-13 19:41:22.76409-04
3022	avalanche-2	Avalanche	avax	9.3	https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1670992574	3292799785	0.81456	2023-09-13 19:41:22.76531-04
3023	chainlink	Chainlink	link	6.02	https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700	3235966194	0.83787	2023-09-13 19:41:22.766667-04
3024	uniswap	Uniswap	uni	4.25	https://assets.coingecko.com/coins/images/12504/large/uni.jpg?1687143398	3206400424	1.06407	2023-09-13 19:41:22.768112-04
3025	true-usd	TrueUSD	tusd	0.998935	https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665	3150526214	0.10856	2023-09-13 19:41:22.769512-04
3026	monero	Monero	xmr	143	https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729	2596264211	1.48737	2023-09-13 19:41:22.770711-04
3027	okb	OKB	okb	42.08	https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050	2524520164	1.04595	2023-09-13 19:41:22.772095-04
3028	binance-usd	Binance USD	busd	0.999979	https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766	2515062438	0.06781	2023-09-13 19:41:22.773302-04
3029	ethereum-classic	Ethereum Classic	etc	15.14	https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169	2165371512	0.97409	2023-09-13 19:41:22.775014-04
3030	cosmos	Cosmos Hub	atom	6.54	https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960	1913131414	2.4562	2023-09-13 19:41:22.776744-04
3031	hedera-hashgraph	Hedera	hbar	0.04975554	https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634	1650430331	5.93166	2023-09-13 19:41:22.778048-04
3032	filecoin	Filecoin	fil	3.17	https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933	1418489041	2.74375	2023-09-13 19:41:22.779279-04
3033	quant-network	Quant	qnt	92.7	https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252	1346237101	-0.14584	2023-09-13 19:41:22.780528-04
3034	crypto-com-chain	Cronos	cro	0.050504	https://assets.coingecko.com/coins/images/7310/large/cro_token_logo.png?1669699773	1326768727	0.60479	2023-09-13 19:41:22.781706-04
3035	lido-dao	Lido DAO	ldo	1.48	https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644	1320952818	1.29246	2023-09-13 19:41:22.782959-04
3036	mantle	Mantle	mnt	0.407266	https://assets.coingecko.com/coins/images/30980/large/token-logo.png?1689320029	1316998530	-0.02118	2023-09-13 19:41:22.784201-04
3037	internet-computer	Internet Computer	icp	2.93	https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073	1302204464	-0.26786	2023-09-13 19:41:22.785434-04
3038	aptos	Aptos	apt	5.19	https://assets.coingecko.com/coins/images/26455/large/aptos_round.png?1666839629	1222684515	2.80619	2023-09-13 19:41:22.786569-04
3039	vechain	VeChain	vet	0.01659505	https://assets.coingecko.com/coins/images/1167/large/VET_Token_Icon.png?1680067517	1204937070	0.96764	2023-09-13 19:41:22.788056-04
3040	optimism	Optimism	op	1.35	https://assets.coingecko.com/coins/images/25244/large/Optimism.png?1660904599	1081553520	0.96212	2023-09-13 19:41:22.789268-04
3041	maker	Maker	mkr	1156.28	https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826	1042240940	3.04249	2023-09-13 19:41:22.79082-04
3042	near	NEAR Protocol	near	1.089	https://assets.coingecko.com/coins/images/10365/large/near.jpg?1683515160	1024336784	1.85062	2023-09-13 19:41:22.793313-04
3043	kaspa	Kaspa	kas	0.04956214	https://assets.coingecko.com/coins/images/25751/large/kaspa-icon-exchanges.png?1653891958	1007111596	16.65332	2023-09-13 19:41:22.795736-04
3044	arbitrum	Arbitrum	arb	0.786422	https://assets.coingecko.com/coins/images/16547/large/photo_2023-03-29_21.47.00.jpeg?1680097630	1002416619	-0.10039	2023-09-13 19:41:22.797228-04
3045	rocket-pool-eth	Rocket Pool ETH	reth	1742.3	https://assets.coingecko.com/coins/images/20764/large/reth.png?1637652366	914993469	0.7369	2023-09-13 19:41:22.798573-04
3046	aave	Aave	aave	53.65	https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110	779878959	1.08496	2023-09-13 19:41:22.799878-04
3047	whitebit	WhiteBIT Coin	wbt	5.28	https://assets.coingecko.com/coins/images/27045/large/wbt_token.png?1667923752	761182298	0.10112	2023-09-13 19:41:22.800992-04
3048	the-graph	The Graph	grt	0.082397	https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566	757544152	3.61197	2023-09-13 19:41:22.802073-04
3049	usdd	USDD	usdd	0.998357	https://assets.coingecko.com/coins/images/25380/large/UUSD.jpg?1651823371	724218844	0.0344	2023-09-13 19:41:22.803318-04
3050	xdce-crowd-sale	XDC Network	xdc	0.052093	https://assets.coingecko.com/coins/images/2912/large/xdc-icon.png?1633700890	722632291	-1.47472	2023-09-13 19:41:22.804472-04
3051	algorand	Algorand	algo	0.090899	https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725	711687052	1.50618	2023-09-13 19:41:22.805798-04
3052	havven	Synthetix Network	snx	2.09	https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139	675226525	2.69968	2023-09-13 19:41:22.807636-04
3053	frax	Frax	frax	0.994948	https://assets.coingecko.com/coins/images/13422/large/FRAX_icon.png?1679886922	669022378	-0.00966	2023-09-13 19:41:22.809426-04
3054	blockstack	Stacks	stx	0.458808	https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510	645624346	3.88264	2023-09-13 19:41:22.811069-04
3055	eos	EOS	eos	0.554697	https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481	621471719	1.27062	2023-09-13 19:41:22.812399-04
3056	bitget-token	Bitget Token	bgb	0.4405	https://assets.coingecko.com/coins/images/11610/large/icon_colour.png?1690515455	617377868	-0.1044	2023-09-13 19:41:22.813595-04
3057	elrond-erd-2	MultiversX	egld	23.52	https://assets.coingecko.com/coins/images/12335/large/egld-token-logo.png?1673490885	609909828	2.64478	2023-09-13 19:41:22.814897-04
3058	tezos	Tezos	xtz	0.644133	https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862	608718029	1.33972	2023-09-13 19:41:22.816007-04
3059	the-sandbox	The Sandbox	sand	0.290102	https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942	599858726	2.54983	2023-09-13 19:41:22.817232-04
3060	bitcoin-cash-sv	Bitcoin SV	bsv	30.81	https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902	593379059	-0.56523	2023-09-13 19:41:22.81835-04
3061	theta-token	Theta Network	theta	0.591312	https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191	591674047	1.59562	2023-09-13 19:41:22.819429-04
3062	radix	Radix	xrd	0.05683	https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658	583106717	-0.35587	2023-09-13 19:41:22.820651-04
3063	injective-protocol	Injective	inj	6.92	https://assets.coingecko.com/coins/images/12882/large/Secondary_Symbol.png?1628233237	578643103	1.60636	2023-09-13 19:41:22.822038-04
3064	immutable-x	ImmutableX	imx	0.492961	https://assets.coingecko.com/coins/images/17233/large/immutableX-symbol-BLK-RGB.png?1665110648	576279209	1.53628	2023-09-13 19:41:22.823303-04
3065	render-token	Render	rndr	1.52	https://assets.coingecko.com/coins/images/11636/large/rndr.png?1638840934	566384324	1.03754	2023-09-13 19:41:22.825574-04
3066	axie-infinity	Axie Infinity	axs	4.25	https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082	557937336	1.4358	2023-09-13 19:41:22.827358-04
3067	fantom	Fantom	ftm	0.1915	https://assets.coingecko.com/coins/images/4001/large/Fantom_round.png?1669652346	537293246	2.24872	2023-09-13 19:41:22.829017-04
3068	gatechain-token	Gate	gt	3.85	https://assets.coingecko.com/coins/images/8183/large/gate.png?1687143308	529550508	0.01762	2023-09-13 19:41:22.830558-04
3069	paxos-standard	Pax Dollar	usdp	0.999593	https://assets.coingecko.com/coins/images/6013/large/Pax_Dollar.png?1629877204	517152265	-0.03928	2023-09-13 19:41:22.831686-04
3070	decentraland	Decentraland	mana	0.279927	https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745	516065574	3.75214	2023-09-13 19:41:22.832788-04
3071	neo	NEO	neo	7.29	https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361	513345381	3.33682	2023-09-13 19:41:22.83384-04
3072	thorchain	THORChain	rune	1.6	https://assets.coingecko.com/coins/images/6595/large/Rune200x200.png?1671179394	481661765	7.56488	2023-09-13 19:41:22.835002-04
3073	compound-ether	cETH	ceth	32.29	https://assets.coingecko.com/coins/images/10643/large/ceth.png?1687143191	476113291	0.34742	2023-09-13 19:41:22.836167-04
3074	kava	Kava	kava	0.618775	https://assets.coingecko.com/coins/images/9761/large/kava.png?1663638871	472732957	1.74725	2023-09-13 19:41:22.837318-04
3075	tether-gold	Tether Gold	xaut	1909.27	https://assets.coingecko.com/coins/images/10481/large/Tether_Gold.png?1668148656	470734170	-0.12103	2023-09-13 19:41:22.838359-04
3076	pax-gold	PAX Gold	paxg	1888.65	https://assets.coingecko.com/coins/images/9519/large/paxgold.png?1687143101	469027852	-0.1326	2023-09-13 19:41:22.839501-04
3077	iota	IOTA	miota	0.168413	https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557	467972757	4.45671	2023-09-13 19:41:22.840994-04
3078	rollbit-coin	Rollbit Coin	rlb	0.142315	https://assets.coingecko.com/coins/images/24552/large/unziL6wO_400x400.jpg?1648134494	467542095	-4.26177	2023-09-13 19:41:22.84263-04
3079	ecash	eCash	xec	2.299e-05	https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446	447213263	1.81173	2023-09-13 19:41:22.844522-04
3080	rocket-pool	Rocket Pool	rpl	21.9	https://assets.coingecko.com/coins/images/2090/large/rocket_pool_%28RPL%29.png?1637662441	435497469	-0.87439	2023-09-13 19:41:22.845825-04
3081	flow	Flow	flow	0.418238	https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776	433082851	2.43828	2023-09-13 19:41:22.847227-04
3082	apecoin	ApeCoin	ape	1.15	https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455	423225104	1.38359	2023-09-13 19:41:22.848346-04
3083	frax-ether	Frax Ether	frxeth	1604.54	https://assets.coingecko.com/coins/images/28284/large/frxETH_icon.png?1679886981	415636884	0.8182	2023-09-13 19:41:22.849558-04
3084	tokenize-xchange	Tokenize Xchange	tkx	5.17	https://assets.coingecko.com/coins/images/4984/large/TKX_-_Logo_-_RGB-15.png?1672912391	414559015	0.51018	2023-09-13 19:41:22.85094-04
3085	kucoin-shares	KuCoin	kcs	4.25	https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720	409928467	2.62734	2023-09-13 19:41:22.852244-04
3086	chiliz	Chiliz	chz	0.056408	https://assets.coingecko.com/coins/images/8834/large/CHZ_Token_updated.png?1675848257	393877629	1.09901	2023-09-13 19:41:22.85418-04
3087	first-digital-usd	First Digital USD	fdusd	0.999836	https://assets.coingecko.com/coins/images/31079/large/firstfigital.jpeg?1690347713	393104054	-0.02836	2023-09-13 19:41:22.855457-04
3088	frax-share	Frax Share	fxs	5.31	https://assets.coingecko.com/coins/images/13423/large/Frax_Shares_icon.png?1679886947	391261031	3.95509	2023-09-13 19:41:22.856921-04
3089	klay-token	Klaytn	klay	0.121227	https://assets.coingecko.com/coins/images/9672/large/klaytn.png?1660288824	386068947	-2.02741	2023-09-13 19:41:22.859579-04
3090	huobi-token	Huobi	ht	2.36	https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992	376966402	0.77631	2023-09-13 19:41:22.861323-04
3091	casper-network	Casper Network	cspr	0.03266534	https://assets.coingecko.com/coins/images/15279/large/casper.PNG?1620341020	370094928	0.03758	2023-09-13 19:41:22.863621-04
3092	bittorrent	BitTorrent	btt	3.87981e-07	https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231	368825542	0.38569	2023-09-13 19:41:22.865371-04
3093	gala	GALA	gala	0.01410624	https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435	368665086	1.32258	2023-09-13 19:41:22.867026-04
3094	curve-dao-token	Curve DAO	crv	0.416262	https://assets.coingecko.com/coins/images/12124/large/Curve.png?1597369484	365249897	3.74027	2023-09-13 19:41:22.868539-04
3095	mina-protocol	Mina Protocol	mina	0.374297	https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004	362975972	1.49887	2023-09-13 19:41:22.869798-04
3096	sui	Sui	sui	0.441456	https://assets.coingecko.com/coins/images/26375/large/sui_asset.jpeg?1683114182	349471306	3.16772	2023-09-13 19:41:22.871166-04
3097	dydx	dYdX	dydx	1.93	https://assets.coingecko.com/coins/images/17500/large/hjnIm9bV.jpg?1628009360	339585779	2.24608	2023-09-13 19:41:22.872303-04
3098	terra-luna	Terra Luna Classic	lunc	5.797e-05	https://assets.coingecko.com/coins/images/8284/large/01_LunaClassic_color.png?1653547790	337830346	1.2079	2023-09-13 19:41:22.873618-04
3099	coinbase-wrapped-staked-eth	Coinbase Wrapped Staked ETH	cbeth	1685.01	https://assets.coingecko.com/coins/images/27008/large/cbeth.png?1661390066	333299610	0.82184	2023-09-13 19:41:22.875263-04
3100	trust-wallet-token	Trust Wallet	twt	0.781973	https://assets.coingecko.com/coins/images/11085/large/Trust.png?1588062702	325748944	0.38348	2023-09-13 19:41:22.877476-04
3101	nexo	NEXO	nexo	0.561521	https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057	319612831	-3.26365	2023-09-13 19:41:22.879744-04
3102	nxm	Nexus Mutual	nxm	46.1	https://assets.coingecko.com/coins/images/11810/large/NXMmain.png?1674799570	311580613	0.78916	2023-09-13 19:41:22.881456-04
3103	gemini-dollar	Gemini Dollar	gusd	0.998648	https://assets.coingecko.com/coins/images/5992/large/gemini-dollar-gusd.png?1536745278	307432315	0.0439	2023-09-13 19:41:22.883013-04
3104	apenft	APENFT	nft	3.03084e-07	https://assets.coingecko.com/coins/images/15687/large/apenft.jpg?1621562368	300125669	0.55505	2023-09-13 19:41:22.884287-04
3105	dash	Dash	dash	25.58	https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930	293192958	0.97174	2023-09-13 19:41:22.885421-04
3106	staked-frax-ether	Staked Frax Ether	sfrxeth	1696.87	https://assets.coingecko.com/coins/images/28285/large/sfrxETH_icon.png?1679886768	293020562	0.9438	2023-09-13 19:41:22.886788-04
3107	compound-usdt	cUSDT	cusdt	0.02700283	https://assets.coingecko.com/coins/images/11621/large/cUSDT.png?1592113270	286438126	12.29404	2023-09-13 19:41:22.888013-04
3108	gmx	GMX	gmx	31.63	https://assets.coingecko.com/coins/images/18323/large/arbit.png?1631532468	285154236	0.73926	2023-09-13 19:41:22.889055-04
3109	pepe	Pepe	pepe	6.75921e-07	https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725	284664210	0.11762	2023-09-13 19:41:22.890388-04
3110	liquity-usd	Liquity USD	lusd	0.99552	https://assets.coingecko.com/coins/images/14666/large/Group_3.png?1617631327	282623019	0.00769	2023-09-13 19:41:22.892478-04
3111	astar	Astar	astr	0.053174	https://assets.coingecko.com/coins/images/22617/large/astr.png?1642314057	279480293	-5.55009	2023-09-13 19:41:22.895859-04
3112	woo-network	WOO Network	woo	0.157774	https://assets.coingecko.com/coins/images/12921/large/w2UiemF__400x400.jpg?1603670367	276573736	1.85401	2023-09-13 19:41:22.898326-04
3113	zilliqa	Zilliqa	zil	0.01606052	https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894	273487478	5.79388	2023-09-13 19:41:22.900764-04
3114	compound-governance-token	Compound	comp	39.77	https://assets.coingecko.com/coins/images/10775/large/COMP.png?1592625425	271924857	8.07629	2023-09-13 19:41:22.903782-04
3115	arweave	Arweave	ar	4.05	https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616	264418384	1.9246	2023-09-13 19:41:22.905747-04
3116	compound-usd-coin	cUSDC	cusdc	0.02304284	https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577	264024596	-0.02444	2023-09-13 19:41:22.907988-04
3117	flare-networks	Flare	flr	0.0112552	https://assets.coingecko.com/coins/images/28624/large/FLR-icon200x200.png?1673325704	263679373	-3.97113	2023-09-13 19:41:22.91001-04
3118	defichain	DeFiChain	dfi	0.351295	https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538	262264593	5.80565	2023-09-13 19:41:22.912824-04
3119	safepal	SafePal	sfp	0.613362	https://assets.coingecko.com/coins/images/13905/large/sfp.png?1660381192	258541316	5.19304	2023-09-13 19:41:22.915121-04
3120	gnosis	Gnosis	gno	99.44	https://assets.coingecko.com/coins/images/662/large/logo_square_simple_300px.png?1609402668	257868285	1.42409	2023-09-13 19:41:22.917108-04
3121	pancakeswap-token	PancakeSwap	cake	1.17	https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065	255166280	0.45057	2023-09-13 19:41:22.918904-04
3122	basic-attention-token	Basic Attention	bat	0.166929	https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427	248484484	3.29466	2023-09-13 19:41:22.920469-04
3123	1inch	1inch	1inch	0.23465	https://assets.coingecko.com/coins/images/13469/large/1inch-token.png?1608803028	241509344	2.89442	2023-09-13 19:41:22.921864-04
3124	chia	Chia	xch	28.23	https://assets.coingecko.com/coins/images/15174/large/zV5K5y9f_400x400.png?1620024414	238819815	2.75704	2023-09-13 19:41:22.924063-04
3125	conflux-token	Conflux	cfx	0.113567	https://assets.coingecko.com/coins/images/13079/large/3vuYMbjN.png?1631512305	238408851	0.78576	2023-09-13 19:41:22.92574-04
3126	fetch-ai	Fetch.ai	fet	0.224092	https://assets.coingecko.com/coins/images/5681/large/Fetch.jpg?1572098136	234216685	-0.48867	2023-09-13 19:41:22.927125-04
3127	mx-token	MX	mx	2.32	https://assets.coingecko.com/coins/images/8545/large/MEXC_GLOBAL_LOGO.jpeg?1670213280	233717071	1.12325	2023-09-13 19:41:22.928375-04
3128	oec-token	OKT Chain	okt	13.05	https://assets.coingecko.com/coins/images/13708/large/WeChat_Image_20220118095654.png?1642471094	233227160	-0.39501	2023-09-13 19:41:22.929536-04
3129	illuvium	Illuvium	ilv	39.88	https://assets.coingecko.com/coins/images/14468/large/logo-200x200.png?1682415398	232845187	-0.34625	2023-09-13 19:41:22.930737-04
3130	huobi-btc	Huobi BTC	hbtc	25834	https://assets.coingecko.com/coins/images/12407/large/hbtc.png?1687143034	231609712	-0.49862	2023-09-13 19:41:22.931776-04
3131	escoin-token	Escoin	elg	2.76	https://assets.coingecko.com/coins/images/13566/large/escoin-200.png?1609833886	228752259	0.57683	2023-09-13 19:41:22.932904-04
3132	ecomi	ECOMI	omi	0.0008414	https://assets.coingecko.com/coins/images/4428/large/ECOMI.png?1557928886	227668840	0.44472	2023-09-13 19:41:22.934119-04
3133	tominet	tomiNet	tomi	3.04	https://assets.coingecko.com/coins/images/28730/large/logo_for_token.png?1673690005	226963199	-2.11044	2023-09-13 19:41:22.935358-04
3134	enjincoin	Enjin Coin	enj	0.223579	https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078	223266890	-1.19057	2023-09-13 19:41:22.936646-04
3135	singularitynet	SingularityNET	agix	0.179855	https://assets.coingecko.com/coins/images/2138/large/singularitynet.png?1548609559	221706770	3.61481	2023-09-13 19:41:22.937963-04
3136	tether-eurt	Euro Tether	eurt	1.074	https://assets.coingecko.com/coins/images/17385/large/Tether_new.png?1683650223	221280020	-0.24936	2023-09-13 19:41:22.939314-04
3137	loopring	Loopring	lrc	0.176821	https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344	220610818	1.36377	2023-09-13 19:41:22.941546-04
3138	nem	NEM	xem	0.02443232	https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663	220179552	1.68681	2023-09-13 19:41:22.943335-04
3139	bitcoin-gold	Bitcoin Gold	btg	13.18	https://assets.coingecko.com/coins/images/1043/large/bitcoin-gold-logo.png?1547034978	219534562	0.35585	2023-09-13 19:41:22.945113-04
3140	qtum	Qtum	qtum	2.09	https://assets.coingecko.com/coins/images/684/large/Qtum_Logo_blue_CG.png?1637155875	219323029	1.61484	2023-09-13 19:41:22.946649-04
3141	celo	Celo	celo	0.42172	https://assets.coingecko.com/coins/images/11090/large/InjXBNx9_400x400.jpg?1674707499	216378052	1.66632	2023-09-13 19:41:22.947937-04
3142	sei-network	Sei	sei	0.119106	https://assets.coingecko.com/coins/images/28205/large/Sei_Logo_-_Transparent.png?1692840622	214756415	0.77272	2023-09-13 19:41:22.94919-04
3143	zcash	Zcash	zec	25.34	https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197	205007304	2.09977	2023-09-13 19:41:22.950354-04
3144	mask-network	Mask Network	mask	2.49	https://assets.coingecko.com/coins/images/14051/large/Mask_Network.jpg?1614050316	204722126	2.29343	2023-09-13 19:41:22.951558-04
3145	osmosis	Osmosis	osmo	0.325738	https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885	200606024	0.75403	2023-09-13 19:41:22.952753-04
3146	decred	Decred	dcr	12.95	https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093	200561191	2.74217	2023-09-13 19:41:22.953839-04
3147	helium	Helium	hnt	1.38	https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071	198987858	-2.64802	2023-09-13 19:41:22.954972-04
3148	oasis-network	Oasis Network	rose	0.03922119	https://assets.coingecko.com/coins/images/13162/large/rose.png?1605772906	197019075	2.79921	2023-09-13 19:41:22.95627-04
3149	theta-fuel	Theta Fuel	tfuel	0.03083604	https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622	193188936	2.2801	2023-09-13 19:41:22.958098-04
3150	olympus	Olympus	ohm	11.11	https://assets.coingecko.com/coins/images/14483/large/token_OHM_%281%29.png?1628311611	192983931	-0.28792	2023-09-13 19:41:22.959471-04
3151	convex-finance	Convex Finance	cvx	2.39	https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328	192062404	1.0875	2023-09-13 19:41:22.960752-04
3152	bone-shibaswap	Bone ShibaSwap	bone	0.822424	https://assets.coingecko.com/coins/images/16916/large/bone_icon.png?1625625505	189294573	-1.48142	2023-09-13 19:41:22.961915-04
3153	holotoken	Holo	hot	0.00105049	https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966	186607630	0.84149	2023-09-13 19:41:22.963101-04
3154	akash-network	Akash Network	akt	0.854926	https://assets.coingecko.com/coins/images/12785/large/akash-logo.png?1615447676	186604672	-6.40153	2023-09-13 19:41:22.964262-04
3155	ethereum-name-service	Ethereum Name Service	ens	7.21	https://assets.coingecko.com/coins/images/19785/large/acatxTm8_400x400.jpg?1635850140	185703276	1.24043	2023-09-13 19:41:22.965412-04
3156	just	JUST	jst	0.02079091	https://assets.coingecko.com/coins/images/11095/large/JUST.jpg?1588175394	184804599	1.97394	2023-09-13 19:41:22.966596-04
3157	aleph-zero	Aleph Zero	azero	0.763287	https://assets.coingecko.com/coins/images/17212/large/gtmuTVa.png?1626853180	184238612	-2.16528	2023-09-13 19:41:22.967737-04
3158	cdai	cDAI	cdai	0.0223835	https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585	182881326	0.05158	2023-09-13 19:41:22.968932-04
3159	ankr	Ankr Network	ankr	0.01821735	https://assets.coingecko.com/coins/images/4324/large/U85xTl2.png?1608111978	182328053	3.91161	2023-09-13 19:41:22.970241-04
3160	beldex	Beldex	bdx	0.03174738	https://assets.coingecko.com/coins/images/5111/large/Beldex.png?1559189036	177283882	-0.24484	2023-09-13 19:41:22.971841-04
3161	wemix-token	WEMIX	wemix	0.558705	https://assets.coingecko.com/coins/images/12998/large/wemixcoin_color_200.png?1666768971	177169270	-0.98231	2023-09-13 19:41:22.973787-04
3162	yearn-finance	yearn.finance	yfi	5309.44	https://assets.coingecko.com/coins/images/11849/large/yearn.jpg?1687142705	175420294	2.28508	2023-09-13 19:41:22.975734-04
3163	livepeer	Livepeer	lpt	6.01	https://assets.coingecko.com/coins/images/7137/large/logo-circle-green.png?1619593365	174684645	0.85332	2023-09-13 19:41:22.977408-04
3164	ravencoin	Ravencoin	rvn	0.01458924	https://assets.coingecko.com/coins/images/3412/large/ravencoin.png?1548386057	173750113	0.9944	2023-09-13 19:41:22.978632-04
3165	stepn	STEPN	gmt	0.145236	https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792	172543286	0.4964	2023-09-13 19:41:22.979902-04
3166	aelf	aelf	elf	0.371145	https://assets.coingecko.com/coins/images/1371/large/aelf-logo.png?1547035397	171220291	7.17895	2023-09-13 19:41:22.981019-04
3167	golem	Golem	glm	0.166256	https://assets.coingecko.com/coins/images/542/large/Golem_Submark_Positive_RGB.png?1606392013	167749828	2.39621	2023-09-13 19:41:22.98208-04
3168	alchemix-usd	Alchemix USD	alusd	0.991492	https://assets.coingecko.com/coins/images/14114/large/Alchemix_USD.png?1614410406	167496334	-0.1635	2023-09-13 19:41:22.983292-04
3169	jasmycoin	JasmyCoin	jasmy	0.00343927	https://assets.coingecko.com/coins/images/13876/large/JASMY200x200.jpg?1612473259	166375377	-1.04268	2023-09-13 19:41:22.984405-04
3170	aragon	Aragon	ant	4.14	https://assets.coingecko.com/coins/images/681/large/Avatar_Circle_x6.png?1685684270	165773790	-0.90744	2023-09-13 19:41:22.985494-04
3171	audius	Audius	audio	0.146075	https://assets.coingecko.com/coins/images/12913/large/AudiusCoinLogo_2x.png?1603425727	162750360	1.64451	2023-09-13 19:41:22.986545-04
3172	btse-token	BTSE Token	btse	1.001	https://assets.coingecko.com/coins/images/10807/large/BTSE_logo_Square.jpeg?1583965964	162228429	-0.04565	2023-09-13 19:41:22.987572-04
3173	kusama	Kusama	ksm	17.98	https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080	161536406	0.87481	2023-09-13 19:41:22.988744-04
3174	blur	Blur	blur	0.173544	https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921	159728393	1.97914	2023-09-13 19:41:22.989867-04
3175	floki	FLOKI	floki	1.598e-05	https://assets.coingecko.com/coins/images/16746/large/PNG_image.png?1643184642	158978830	1.40348	2023-09-13 19:41:22.991299-04
3176	baby-doge-coin	Baby Doge Coin	babydoge	1.02e-09	https://assets.coingecko.com/coins/images/16125/large/babydoge.jpg?1676303229	158701597	-1.89094	2023-09-13 19:41:22.993018-04
3177	waves	Waves	waves	1.55	https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117	154955562	1.47102	2023-09-13 19:41:22.994608-04
3178	icon	ICON	icx	0.158942	https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png?1547035003	154417921	2.85068	2023-09-13 19:41:22.99582-04
3179	link	FINSCHIA	fnsa	20.86	https://assets.coingecko.com/coins/images/6450/large/FINSCHIA_coin_icon%28black%29.png?1685058330	149363645	0.07123	2023-09-13 19:41:22.996934-04
3180	iotex	IoTeX	iotx	0.01570097	https://assets.coingecko.com/coins/images/3334/large/iotex-logo.png?1547037941	148659518	2.28035	2023-09-13 19:41:22.998175-04
3181	terra-luna-2	Terra	luna	0.391167	https://assets.coingecko.com/coins/images/25767/large/01_Luna_color.png?1653556122	146146963	0.03207	2023-09-13 19:41:22.999411-04
3182	swipe	SXP	sxp	0.252518	https://assets.coingecko.com/coins/images/9368/large/swipe.png?1566792311	146063650	3.07334	2023-09-13 19:41:23.000802-04
3183	dao-maker	DAO Maker	dao	0.74084	https://assets.coingecko.com/coins/images/13915/large/4.png?1612838831	141620977	0.72451	2023-09-13 19:41:23.002057-04
3184	ethereum-pow-iou	EthereumPoW	ethw	1.31	https://assets.coingecko.com/coins/images/26997/large/logo-clear.png?1661311105	141120131	-0.29697	2023-09-13 19:41:23.003395-04
3185	siacoin	Siacoin	sc	0.00273991	https://assets.coingecko.com/coins/images/289/large/siacoin.png?1548386465	141031449	1.03218	2023-09-13 19:41:23.004649-04
3186	ontology	Ontology	ont	0.15701	https://assets.coingecko.com/coins/images/3447/large/ONT.png?1583481820	140196210	3.03171	2023-09-13 19:41:23.005921-04
3187	balancer	Balancer	bal	3.21	https://assets.coingecko.com/coins/images/11683/large/Balancer.png?1592792958	138642503	0.41224	2023-09-13 19:41:23.007358-04
3188	ribbon-finance	Ribbon Finance	rbn	0.175511	https://assets.coingecko.com/coins/images/15823/large/RBN_64x64.png?1633529723	138326583	-2.97365	2023-09-13 19:41:23.009177-04
3189	ocean-protocol	Ocean Protocol	ocean	0.312536	https://assets.coingecko.com/coins/images/3687/large/ocean-protocol-logo.jpg?1547038686	135707810	0.61949	2023-09-13 19:41:23.010841-04
3190	seth2	sETH2	seth2	1594.76	https://assets.coingecko.com/coins/images/16569/large/emerald256.png?1624494960	135528961	0.81855	2023-09-13 19:41:23.012338-04
3191	axelar	Axelar	axl	0.341119	https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg?1663121730	135329896	-1.70558	2023-09-13 19:41:23.013534-04
3192	band-protocol	Band Protocol	band	0.995506	https://assets.coingecko.com/coins/images/9545/large/Band_token_blue_violet_token.png?1625881431	133696207	1.71877	2023-09-13 19:41:23.014742-04
3193	stasis-eurs	STASIS EURO	eurs	1.073	https://assets.coingecko.com/coins/images/5164/large/EURS_300x300.png?1550571779	133149577	0.07578	2023-09-13 19:41:23.015901-04
3194	worldcoin-wld	Worldcoin	wld	1.012	https://assets.coingecko.com/coins/images/31069/large/worldcoin.jpeg?1690182386	131583436	-0.3795	2023-09-13 19:41:23.017213-04
3195	open-exchange-token	Open Exchange Token	ox	0.03377755	https://assets.coingecko.com/coins/images/30604/large/Logo2.png?1685522119	131511105	18.94149	2023-09-13 19:41:23.018468-04
3196	biconomy	Biconomy	bico	0.199265	https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1638269749	131215798	0.97857	2023-09-13 19:41:23.01959-04
3197	iostoken	IOST	iost	0.00686739	https://assets.coingecko.com/coins/images/2523/large/IOST.png?1557555183	128560963	1.65269	2023-09-13 19:41:23.020793-04
3198	kadena	Kadena	kda	0.520626	https://assets.coingecko.com/coins/images/3693/large/Logo.png?1686042789	127869920	0.9425	2023-09-13 19:41:23.022026-04
3199	wax	WAX	waxp	0.03765648	https://assets.coingecko.com/coins/images/1372/large/WAX_Coin_Tickers_P_512px.png?1602812260	126416637	2.06523	2023-09-13 19:41:23.023954-04
3200	merit-circle	Merit Circle	mc	0.262892	https://assets.coingecko.com/coins/images/19304/large/Db4XqML.png?1634972154	121682317	-1.24856	2023-09-13 19:41:23.025807-04
3201	moonbeam	Moonbeam	glmr	0.165284	https://assets.coingecko.com/coins/images/22459/large/glmr.png?1641880985	121645886	-0.66621	2023-09-13 19:41:23.027541-04
3202	ronin	Ronin	ron	0.477537	https://assets.coingecko.com/coins/images/20009/large/Ronin_Mark_Blue.png?1686729719	120940858	0.03527	2023-09-13 19:41:23.029021-04
3203	canvas-n-glr	GalleryCoin	glr	0.500501	https://assets.coingecko.com/coins/images/29372/large/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%BD%94%EC%9D%B8_%EB%A1%9C%EA%B3%A0%28200_200%29.png?1678350274	120577668	-0.51884	2023-09-13 19:41:23.030312-04
3204	tomochain	TomoChain	tomo	1.24	https://assets.coingecko.com/coins/images/3416/large/Asset_59_2x.png?1582948925	119623865	2.42955	2023-09-13 19:41:23.031817-04
3205	terrausd	TerraClassicUSD	ustc	0.01210101	https://assets.coingecko.com/coins/images/12681/large/UST.png?1653548090	118536169	-0.24502	2023-09-13 19:41:23.03311-04
3206	sushi	Sushi	sushi	0.613366	https://assets.coingecko.com/coins/images/12271/large/512x512_Logo_no_chop.png?1606986688	118033261	5.54935	2023-09-13 19:41:23.034333-04
3207	swissborg	SwissBorg	chsb	0.123234	https://assets.coingecko.com/coins/images/2117/large/YJUrRy7r_400x400.png?1589794215	117194870	0.77592	2023-09-13 19:41:23.03559-04
3208	bitcoin-avalanche-bridged-btc-b	Bitcoin Avalanche Bridged (BTC.b)	btc.b	26196	https://assets.coingecko.com/coins/images/26115/large/btcb.png?1655921693	115935871	1.14949	2023-09-13 19:41:23.037278-04
3209	wrapped-beacon-eth	Wrapped Beacon ETH	wbeth	1634.02	https://assets.coingecko.com/coins/images/30061/large/wbeth-icon.png?1683001548	115753041	0.93659	2023-09-13 19:41:23.038859-04
3210	harmony	Harmony	one	0.00939736	https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793	115631045	1.48683	2023-09-13 19:41:23.040471-04
3211	tribe-2	Tribe	tribe	0.253172	https://assets.coingecko.com/coins/images/14575/large/tribe.PNG?1617487954	115182923	-1.35157	2023-09-13 19:41:23.042874-04
3212	crvusd	crvUSD	crvusd	0.995487	https://assets.coingecko.com/coins/images/30118/large/crvusd.jpeg?1683171990	111440159	-0.15859	2023-09-13 19:41:23.044336-04
3213	skale	SKALE	skl	0.02360649	https://assets.coingecko.com/coins/images/13245/large/SKALE_token_300x300.png?1606789574	110855130	7.83892	2023-09-13 19:41:23.045695-04
3214	bora	BORA	bora	0.111674	https://assets.coingecko.com/coins/images/7646/large/mqFw8hxm_400x400.jpeg?1656657343	110452358	1.10534	2023-09-13 19:41:23.046794-04
3215	magic	Magic	magic	0.466553	https://assets.coingecko.com/coins/images/18623/large/magic.png?1656052146	110396092	6.69169	2023-09-13 19:41:23.047947-04
3216	polymath	Polymath	poly	0.120666	https://assets.coingecko.com/coins/images/2784/large/inKkF01.png?1605007034	108798923	-0.51126	2023-09-13 19:41:23.049252-04
3217	ssv-network	SSV Network	ssv	15.21	https://assets.coingecko.com/coins/images/19155/large/ssv.png?1638181902	107840085	1.87134	2023-09-13 19:41:23.050457-04
3218	digibyte	DigiByte	dgb	0.00644901	https://assets.coingecko.com/coins/images/63/large/digibyte.png?1547033717	106647709	3.54741	2023-09-13 19:41:23.051575-04
3219	energy-web-token	Energy Web	ewt	2.17	https://assets.coingecko.com/coins/images/10886/large/R9gQTJV__400x400.png?1585604557	104403383	0.81528	2023-09-13 19:41:23.052786-04
3220	hive	Hive	hive	0.276626	https://assets.coingecko.com/coins/images/10840/large/logo_transparent_4x.png?1584623184	102625908	2.82052	2023-09-13 19:41:23.054104-04
3221	zelcash	Flux	flux	0.322388	https://assets.coingecko.com/coins/images/5163/large/Flux_symbol_blue-white.png?1617192144	102511016	1.06763	2023-09-13 19:41:23.055413-04
3222	nucypher	NuCypher	nu	0.053569	https://assets.coingecko.com/coins/images/3318/large/photo1198982838879365035.jpg?1547037916	102416061	-0.33017	2023-09-13 19:41:23.056895-04
3223	lisk	Lisk	lsk	0.706202	https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png?1573444104	100879686	3.90925	2023-09-13 19:41:23.058954-04
3224	vethor-token	VeThor	vtho	0.00148642	https://assets.coingecko.com/coins/images/5230/large/VTHO_Token_Icon.png?1680056937	99946114	45.99845	2023-09-13 19:41:23.060373-04
3225	api3	API3	api3	1.05	https://assets.coingecko.com/coins/images/13256/large/api3.jpg?1606751424	99908262	3.27427	2023-09-13 19:41:23.061747-04
3226	uma	UMA	uma	1.34	https://assets.coingecko.com/coins/images/10951/large/UMA.png?1586307916	98998008	1.25126	2023-09-13 19:41:23.063087-04
3227	zencash	Horizen	zen	7.01	https://assets.coingecko.com/coins/images/691/large/horizen.png?1555052241	98821943	2.28206	2023-09-13 19:41:23.064496-04
3228	echelon-prime	Echelon Prime	prime	4.25	https://assets.coingecko.com/coins/images/29053/large/prime-logo-small-border_%282%29.png?1684901261	98408273	2.05953	2023-09-13 19:41:23.065585-04
3229	gains-network	Gains Network	gns	3.21	https://assets.coingecko.com/coins/images/19737/large/logo.png?1635909203	97220525	6.5655	2023-09-13 19:41:23.066837-04
3230	msol	Marinade staked SOL	msol	20.87	https://assets.coingecko.com/coins/images/17752/large/mSOL.png?1644541955	97152743	2.50724	2023-09-13 19:41:23.068146-04
3231	metal	Metal DAO	mtl	1.48	https://assets.coingecko.com/coins/images/763/large/Metal.png?1592195010	96754377	9.60698	2023-09-13 19:41:23.069244-04
3232	amp-token	Amp	amp	0.0017057	https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397	95726102	-0.83429	2023-09-13 19:41:23.070351-04
3233	kyber-network-crystal	Kyber Network Crystal	knc	0.516275	https://assets.coingecko.com/coins/images/14899/large/RwdVsGcw_400x400.jpg?1618923851	94019470	2.50386	2023-09-13 19:41:23.071432-04
3234	reserve-rights-token	Reserve Rights	rsr	0.0018511	https://assets.coingecko.com/coins/images/8365/large/rsr.png?1637983320	93806949	6.12691	2023-09-13 19:41:23.072581-04
3235	everscale	Everscale	ever	0.051759	https://assets.coingecko.com/coins/images/12783/large/everscale_badge_main_round_1x.png?1640050196	93380641	-3.00997	2023-09-13 19:41:23.073838-04
3236	cartesi	Cartesi	ctsi	0.126799	https://assets.coingecko.com/coins/images/11038/large/Cartesi_Logo.png?1689603517	93277221	7.2633	2023-09-13 19:41:23.075899-04
3237	stargate-finance	Stargate Finance	stg	0.451745	https://assets.coingecko.com/coins/images/24413/large/STG_LOGO.png?1647654518	92363689	-0.0236	2023-09-13 19:41:23.077576-04
3238	blox	Blox	cdt	0.132197	https://assets.coingecko.com/coins/images/1231/large/Blox_Staking_Logo_2.png?1609117544	90722412	-15.34354	2023-09-13 19:41:23.078728-04
3239	bitkub-coin	Bitkub Coin	kub	1.022	https://assets.coingecko.com/coins/images/15760/large/KUB.png?1621825161	90384512	1.13995	2023-09-13 19:41:23.079921-04
3240	krypton-dao	Krypton DAO	krd	0.875493	https://assets.coingecko.com/coins/images/25467/large/krd.png?1651915442	89710640	-3.1995	2023-09-13 19:41:23.081215-04
3241	deso	Decentralized Social	deso	8.49	https://assets.coingecko.com/coins/images/16310/large/deso-logo-refresh-white.png?1666430590	89499288	-1.24685	2023-09-13 19:41:23.082354-04
3242	polymesh	Polymesh	polyx	0.104763	https://assets.coingecko.com/coins/images/23496/large/Polymesh-symbol.png?1683256883	89196987	1.75353	2023-09-13 19:41:23.08347-04
3243	nervos-network	Nervos Network	ckb	0.00267092	https://assets.coingecko.com/coins/images/9566/large/Nervos_White.png?1608280856	89160373	2.06263	2023-09-13 19:41:23.084721-04
3244	e-radix	e-Radix	exrd	0.057416	https://assets.coingecko.com/coins/images/13145/large/exrd_logo.png?1605662677	86992980	0.86011	2023-09-13 19:41:23.085923-04
3245	lukso-token	LUKSO [OLD]	lyxe	5.63	https://assets.coingecko.com/coins/images/11423/large/LYX.png?1689818779	86452513	-0.39868	2023-09-13 19:41:23.087056-04
3246	stp-network	STP	stpt	0.0440599	https://assets.coingecko.com/coins/images/8713/large/STP.png?1560262664	85670408	3.84697	2023-09-13 19:41:23.088319-04
3247	status	Status	snt	0.0215402	https://assets.coingecko.com/coins/images/779/large/status.png?1548610778	85343693	1.30878	2023-09-13 19:41:23.089586-04
3248	murasaki	Murasaki	mura	1.46	https://assets.coingecko.com/coins/images/28570/large/mura.png?1671795851	83715138	-0.47388	2023-09-13 19:41:23.091506-04
3249	pundi-x-2	Pundi X	pundix	0.323796	https://assets.coingecko.com/coins/images/14571/large/vDyefsXq_400x400.jpg?1617085003	83661144	2.6402	2023-09-13 19:41:23.093361-04
3250	joe	JOE	joe	0.244316	https://assets.coingecko.com/coins/images/17569/large/traderjoe.png?1685690062	83536454	1.04247	2023-09-13 19:41:23.095685-04
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jpmora
--

COPY public.users (username, password, first_name, last_name, email) FROM stdin;
JPMora	$2b$12$C576ofY5n3R/x6F1dCLE4uyofOrYolS5EIHAYULAkjSTTfUt5.9li	Pablo	Mora	testingtest@test.com
Cisco	$2b$12$zqTWmbs2E1ACrqNoD8BlleoiEuVJbmxMD.BiM65z8hHHIAjB9TS7a	Cisco	Mora	Cisco@gmail.com
Nala	$2b$12$9mLEBPX4grkA4hN9TvDW4ez3wIJLa6nQUhLDODElTLBQBxRycrCc2	Nala	Mora	nala@gmail.com
Matt	$2b$12$BS/ROR2iUsBhbdriex85ou/cUZmp8XysYozkg7td1hv.UY6LThs3G	Matt	Mora	Matt@gmail.com
jpmora123	$2b$12$Rk7EWu.bAgH7bp3NpuG3teudejplL5dpGeqk.u64CP4kBkCV3MNCm	jpmora	mora	jpmora@email.com
Caro	$2b$12$CG9r5a6COtgEaQiQxBpOKOv75.TLn2FrUpF6HLyhclbIJubXqwC4a	Caro	mora	caro@testing.com
\.


--
-- Data for Name: watchlist_items; Type: TABLE DATA; Schema: public; Owner: jpmora
--

COPY public.watchlist_items (watchlist_item_id, watchlist_id, coin_id) FROM stdin;
1	26	2
3	28	10
5	25	12
6	25	17
7	26	22
10	36	9
11	36	20
12	25	4
14	37	3
15	37	7
16	38	9
17	38	12
18	38	17
19	39	18
20	39	15
21	39	13
23	37	4
24	37	7
25	38	14
26	38	20
27	39	25
28	39	24
29	39	23
30	45	24
\.


--
-- Data for Name: watchlists; Type: TABLE DATA; Schema: public; Owner: jpmora
--

COPY public.watchlists (watchlist_id, username, name, created_at) FROM stdin;
25	JPMora	Cisco	2023-08-09 22:51:01.519826-04
26	JPMora	Nala	2023-08-09 22:51:02.501733-04
28	JPMora	Ray	2023-08-09 22:51:05.629267-04
29	Cisco	Ray	2023-08-18 09:31:35.904859-04
30	Nala	Cisco	2023-08-25 08:55:13.50414-04
31	Nala	Naka	2023-08-25 08:55:16.257042-04
32	jpmora123	nala	2023-09-05 13:41:01.66837-04
33	jpmora123	nala	2023-09-05 13:41:01.670545-04
36	JPMora	Matthew	2023-09-09 20:22:30.140264-04
37	Caro	1	2023-09-13 19:28:51.927706-04
38	Caro	2	2023-09-13 19:28:52.488606-04
39	Caro	3	2023-09-13 19:28:52.854451-04
45	Caro	4	2023-09-20 22:46:37.747779-04
\.


--
-- Name: coins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jpmora
--

SELECT pg_catalog.setval('public.coins_id_seq', 3250, true);


--
-- Name: watchlist_items_watchlist_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jpmora
--

SELECT pg_catalog.setval('public.watchlist_items_watchlist_item_id_seq', 30, true);


--
-- Name: watchlists_watchlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jpmora
--

SELECT pg_catalog.setval('public.watchlists_watchlist_id_seq', 45, true);


--
-- Name: coins coins_pkey; Type: CONSTRAINT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.coins
    ADD CONSTRAINT coins_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: watchlist_items watchlist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.watchlist_items
    ADD CONSTRAINT watchlist_items_pkey PRIMARY KEY (watchlist_item_id);


--
-- Name: watchlists watchlists_pkey; Type: CONSTRAINT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT watchlists_pkey PRIMARY KEY (watchlist_id);


--
-- Name: watchlist_items watchlist_items_coin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.watchlist_items
    ADD CONSTRAINT watchlist_items_coin_id_fkey FOREIGN KEY (coin_id) REFERENCES public.coins(id) ON DELETE CASCADE;


--
-- Name: watchlist_items watchlist_items_watchlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.watchlist_items
    ADD CONSTRAINT watchlist_items_watchlist_id_fkey FOREIGN KEY (watchlist_id) REFERENCES public.watchlists(watchlist_id) ON DELETE CASCADE;


--
-- Name: watchlists watchlists_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jpmora
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT watchlists_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

