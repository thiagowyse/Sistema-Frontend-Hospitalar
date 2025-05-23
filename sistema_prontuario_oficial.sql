PGDMP                      }            sistema_prontuario    17.2    17.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    49165    sistema_prontuario    DATABASE     �   CREATE DATABASE sistema_prontuario WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 "   DROP DATABASE sistema_prontuario;
                     postgres    false            �            1259    49166    agendamento    TABLE     �  CREATE TABLE public.agendamento (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    medico_id integer NOT NULL,
    data_consulta timestamp without time zone NOT NULL,
    status character varying(50) DEFAULT 'Agendado'::character varying,
    CONSTRAINT agendamento_status_check CHECK (((status)::text = ANY (ARRAY[('Agendado'::character varying)::text, ('Realizado'::character varying)::text, ('Cancelado'::character varying)::text])))
);
    DROP TABLE public.agendamento;
       public         heap r       postgres    false            �            1259    49171    agendamento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.agendamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.agendamento_id_seq;
       public               postgres    false    217            �           0    0    agendamento_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.agendamento_id_seq OWNED BY public.agendamento.id;
          public               postgres    false    218            �            1259    49172    atestado    TABLE     �   CREATE TABLE public.atestado (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    medico_id integer NOT NULL,
    data_emissao date NOT NULL,
    descricao text NOT NULL,
    validade date
);
    DROP TABLE public.atestado;
       public         heap r       postgres    false            �            1259    49177    atestado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atestado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.atestado_id_seq;
       public               postgres    false    219            �           0    0    atestado_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.atestado_id_seq OWNED BY public.atestado.id;
          public               postgres    false    220            �            1259    49178 
   declaracao    TABLE       CREATE TABLE public.declaracao (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    medico_id integer NOT NULL,
    data_emissao date NOT NULL,
    tipo_declaracao character varying(255) NOT NULL,
    descricao text NOT NULL,
    validade date
);
    DROP TABLE public.declaracao;
       public         heap r       postgres    false            �            1259    49183    declaracao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.declaracao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.declaracao_id_seq;
       public               postgres    false    221            �           0    0    declaracao_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.declaracao_id_seq OWNED BY public.declaracao.id;
          public               postgres    false    222            �            1259    49184 
   enfermeiro    TABLE     �   CREATE TABLE public.enfermeiro (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    coren character varying(50) NOT NULL
);
    DROP TABLE public.enfermeiro;
       public         heap r       postgres    false            �            1259    49187    enfermeiro_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enfermeiro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.enfermeiro_id_seq;
       public               postgres    false    223            �           0    0    enfermeiro_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.enfermeiro_id_seq OWNED BY public.enfermeiro.id;
          public               postgres    false    224            �            1259    49188    especialidade    TABLE     i   CREATE TABLE public.especialidade (
    id integer NOT NULL,
    nome character varying(255) NOT NULL
);
 !   DROP TABLE public.especialidade;
       public         heap r       postgres    false            �            1259    49191    especialidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.especialidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.especialidade_id_seq;
       public               postgres    false    225            �           0    0    especialidade_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.especialidade_id_seq OWNED BY public.especialidade.id;
          public               postgres    false    226            �            1259    49192    exame    TABLE     u   CREATE TABLE public.exame (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao text
);
    DROP TABLE public.exame;
       public         heap r       postgres    false            �            1259    49197    exame_id_seq    SEQUENCE     �   CREATE SEQUENCE public.exame_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.exame_id_seq;
       public               postgres    false    227            �           0    0    exame_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.exame_id_seq OWNED BY public.exame.id;
          public               postgres    false    228            �            1259    49198    historico_atendimento    TABLE     �   CREATE TABLE public.historico_atendimento (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    medico_id integer NOT NULL,
    descricao text,
    data_atendimento date NOT NULL
);
 )   DROP TABLE public.historico_atendimento;
       public         heap r       postgres    false            �            1259    49203    historico_atendimento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.historico_atendimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.historico_atendimento_id_seq;
       public               postgres    false    229            �           0    0    historico_atendimento_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.historico_atendimento_id_seq OWNED BY public.historico_atendimento.id;
          public               postgres    false    230            �            1259    49204    log_usuario    TABLE     �   CREATE TABLE public.log_usuario (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    acao character varying(255) NOT NULL,
    data_acao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.log_usuario;
       public         heap r       postgres    false            �            1259    49208    log_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.log_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.log_usuario_id_seq;
       public               postgres    false    231            �           0    0    log_usuario_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.log_usuario_id_seq OWNED BY public.log_usuario.id;
          public               postgres    false    232            �            1259    49209    medicamento    TABLE     �   CREATE TABLE public.medicamento (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    dosagem character varying(50),
    via_administracao character varying(50)
);
    DROP TABLE public.medicamento;
       public         heap r       postgres    false            �            1259    49212    medicamento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medicamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.medicamento_id_seq;
       public               postgres    false    233            �           0    0    medicamento_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.medicamento_id_seq OWNED BY public.medicamento.id;
          public               postgres    false    234            �            1259    49213    medico    TABLE     �   CREATE TABLE public.medico (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    crm character varying(50) NOT NULL
);
    DROP TABLE public.medico;
       public         heap r       postgres    false            �            1259    49216    medico_especialidade    TABLE     t   CREATE TABLE public.medico_especialidade (
    medico_id integer NOT NULL,
    especialidade_id integer NOT NULL
);
 (   DROP TABLE public.medico_especialidade;
       public         heap r       postgres    false            �            1259    49219    medico_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.medico_id_seq;
       public               postgres    false    235            �           0    0    medico_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.medico_id_seq OWNED BY public.medico.id;
          public               postgres    false    237            �            1259    49220    paciente    TABLE     �   CREATE TABLE public.paciente (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    endereco character varying(255),
    telefone character varying(15),
    data_nascimento date
);
    DROP TABLE public.paciente;
       public         heap r       postgres    false            �            1259    49225    paciente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paciente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.paciente_id_seq;
       public               postgres    false    238            �           0    0    paciente_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.paciente_id_seq OWNED BY public.paciente.id;
          public               postgres    false    239            �            1259    49226    perfil    TABLE     a   CREATE TABLE public.perfil (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);
    DROP TABLE public.perfil;
       public         heap r       postgres    false            �            1259    49229    perfil_id_seq    SEQUENCE     �   CREATE SEQUENCE public.perfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.perfil_id_seq;
       public               postgres    false    240                        0    0    perfil_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.perfil_id_seq OWNED BY public.perfil.id;
          public               postgres    false    241            �            1259    49230 
   prontuario    TABLE     �   CREATE TABLE public.prontuario (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    medico_id integer NOT NULL,
    descricao text,
    data_criacao date NOT NULL
);
    DROP TABLE public.prontuario;
       public         heap r       postgres    false            �            1259    49235    prontuario_exame    TABLE     l   CREATE TABLE public.prontuario_exame (
    prontuario_id integer NOT NULL,
    exame_id integer NOT NULL
);
 $   DROP TABLE public.prontuario_exame;
       public         heap r       postgres    false            �            1259    49238    prontuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prontuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.prontuario_id_seq;
       public               postgres    false    242                       0    0    prontuario_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.prontuario_id_seq OWNED BY public.prontuario.id;
          public               postgres    false    244            �            1259    49239    prontuario_medicamento    TABLE     x   CREATE TABLE public.prontuario_medicamento (
    prontuario_id integer NOT NULL,
    medicamento_id integer NOT NULL
);
 *   DROP TABLE public.prontuario_medicamento;
       public         heap r       postgres    false            �            1259    49242    receita    TABLE     �  CREATE TABLE public.receita (
    id integer NOT NULL,
    prontuario_id integer NOT NULL,
    data_receita date NOT NULL,
    validade date,
    descricao text,
    status character varying(50) DEFAULT 'Ativa'::character varying,
    CONSTRAINT receita_status_check CHECK (((status)::text = ANY (ARRAY[('Ativa'::character varying)::text, ('Expirada'::character varying)::text, ('Concluída'::character varying)::text])))
);
    DROP TABLE public.receita;
       public         heap r       postgres    false            �            1259    49249    receita_id_seq    SEQUENCE     �   CREATE SEQUENCE public.receita_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.receita_id_seq;
       public               postgres    false    246                       0    0    receita_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.receita_id_seq OWNED BY public.receita.id;
          public               postgres    false    247            �            1259    49250    receita_medicamento    TABLE     �   CREATE TABLE public.receita_medicamento (
    receita_id integer NOT NULL,
    medicamento_id integer NOT NULL,
    quantidade integer NOT NULL
);
 '   DROP TABLE public.receita_medicamento;
       public         heap r       postgres    false            �            1259    49253    recepcionista    TABLE     `   CREATE TABLE public.recepcionista (
    id integer NOT NULL,
    usuario_id integer NOT NULL
);
 !   DROP TABLE public.recepcionista;
       public         heap r       postgres    false            �            1259    49256    recepcionista_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recepcionista_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.recepcionista_id_seq;
       public               postgres    false    249                       0    0    recepcionista_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.recepcionista_id_seq OWNED BY public.recepcionista.id;
          public               postgres    false    250            �            1259    49257    usuario    TABLE     %  CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    username character varying(50) NOT NULL,
    senha character varying(255) NOT NULL,
    perfil_id integer,
    email character varying(255) NOT NULL,
    cpf character varying(14) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    49262    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public               postgres    false    251                       0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public               postgres    false    252            �           2604    49263    agendamento id    DEFAULT     p   ALTER TABLE ONLY public.agendamento ALTER COLUMN id SET DEFAULT nextval('public.agendamento_id_seq'::regclass);
 =   ALTER TABLE public.agendamento ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217            �           2604    49264    atestado id    DEFAULT     j   ALTER TABLE ONLY public.atestado ALTER COLUMN id SET DEFAULT nextval('public.atestado_id_seq'::regclass);
 :   ALTER TABLE public.atestado ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219            �           2604    49265    declaracao id    DEFAULT     n   ALTER TABLE ONLY public.declaracao ALTER COLUMN id SET DEFAULT nextval('public.declaracao_id_seq'::regclass);
 <   ALTER TABLE public.declaracao ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221            �           2604    49266    enfermeiro id    DEFAULT     n   ALTER TABLE ONLY public.enfermeiro ALTER COLUMN id SET DEFAULT nextval('public.enfermeiro_id_seq'::regclass);
 <   ALTER TABLE public.enfermeiro ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223            �           2604    49267    especialidade id    DEFAULT     t   ALTER TABLE ONLY public.especialidade ALTER COLUMN id SET DEFAULT nextval('public.especialidade_id_seq'::regclass);
 ?   ALTER TABLE public.especialidade ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    225            �           2604    49268    exame id    DEFAULT     d   ALTER TABLE ONLY public.exame ALTER COLUMN id SET DEFAULT nextval('public.exame_id_seq'::regclass);
 7   ALTER TABLE public.exame ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227            �           2604    49269    historico_atendimento id    DEFAULT     �   ALTER TABLE ONLY public.historico_atendimento ALTER COLUMN id SET DEFAULT nextval('public.historico_atendimento_id_seq'::regclass);
 G   ALTER TABLE public.historico_atendimento ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    229            �           2604    49270    log_usuario id    DEFAULT     p   ALTER TABLE ONLY public.log_usuario ALTER COLUMN id SET DEFAULT nextval('public.log_usuario_id_seq'::regclass);
 =   ALTER TABLE public.log_usuario ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    231            �           2604    49271    medicamento id    DEFAULT     p   ALTER TABLE ONLY public.medicamento ALTER COLUMN id SET DEFAULT nextval('public.medicamento_id_seq'::regclass);
 =   ALTER TABLE public.medicamento ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    234    233            �           2604    49272 	   medico id    DEFAULT     f   ALTER TABLE ONLY public.medico ALTER COLUMN id SET DEFAULT nextval('public.medico_id_seq'::regclass);
 8   ALTER TABLE public.medico ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    235            �           2604    49273    paciente id    DEFAULT     j   ALTER TABLE ONLY public.paciente ALTER COLUMN id SET DEFAULT nextval('public.paciente_id_seq'::regclass);
 :   ALTER TABLE public.paciente ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    239    238            �           2604    49274 	   perfil id    DEFAULT     f   ALTER TABLE ONLY public.perfil ALTER COLUMN id SET DEFAULT nextval('public.perfil_id_seq'::regclass);
 8   ALTER TABLE public.perfil ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    240            �           2604    49275    prontuario id    DEFAULT     n   ALTER TABLE ONLY public.prontuario ALTER COLUMN id SET DEFAULT nextval('public.prontuario_id_seq'::regclass);
 <   ALTER TABLE public.prontuario ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    242            �           2604    49276 
   receita id    DEFAULT     h   ALTER TABLE ONLY public.receita ALTER COLUMN id SET DEFAULT nextval('public.receita_id_seq'::regclass);
 9   ALTER TABLE public.receita ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    247    246            �           2604    49277    recepcionista id    DEFAULT     t   ALTER TABLE ONLY public.recepcionista ALTER COLUMN id SET DEFAULT nextval('public.recepcionista_id_seq'::regclass);
 ?   ALTER TABLE public.recepcionista ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    250    249            �           2604    49278 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    252    251            �          0    49166    agendamento 
   TABLE DATA           X   COPY public.agendamento (id, paciente_id, medico_id, data_consulta, status) FROM stdin;
    public               postgres    false    217   ν       �          0    49172    atestado 
   TABLE DATA           a   COPY public.atestado (id, paciente_id, medico_id, data_emissao, descricao, validade) FROM stdin;
    public               postgres    false    219   �       �          0    49178 
   declaracao 
   TABLE DATA           t   COPY public.declaracao (id, paciente_id, medico_id, data_emissao, tipo_declaracao, descricao, validade) FROM stdin;
    public               postgres    false    221   ��       �          0    49184 
   enfermeiro 
   TABLE DATA           ;   COPY public.enfermeiro (id, usuario_id, coren) FROM stdin;
    public               postgres    false    223   n�       �          0    49188    especialidade 
   TABLE DATA           1   COPY public.especialidade (id, nome) FROM stdin;
    public               postgres    false    225   ��       �          0    49192    exame 
   TABLE DATA           4   COPY public.exame (id, nome, descricao) FROM stdin;
    public               postgres    false    227   ʿ       �          0    49198    historico_atendimento 
   TABLE DATA           h   COPY public.historico_atendimento (id, paciente_id, medico_id, descricao, data_atendimento) FROM stdin;
    public               postgres    false    229   O�       �          0    49204    log_usuario 
   TABLE DATA           F   COPY public.log_usuario (id, usuario_id, acao, data_acao) FROM stdin;
    public               postgres    false    231   ��       �          0    49209    medicamento 
   TABLE DATA           K   COPY public.medicamento (id, nome, dosagem, via_administracao) FROM stdin;
    public               postgres    false    233   b�       �          0    49213    medico 
   TABLE DATA           5   COPY public.medico (id, usuario_id, crm) FROM stdin;
    public               postgres    false    235   ��       �          0    49216    medico_especialidade 
   TABLE DATA           K   COPY public.medico_especialidade (medico_id, especialidade_id) FROM stdin;
    public               postgres    false    236   ��       �          0    49220    paciente 
   TABLE DATA           Q   COPY public.paciente (id, nome, endereco, telefone, data_nascimento) FROM stdin;
    public               postgres    false    238   �       �          0    49226    perfil 
   TABLE DATA           *   COPY public.perfil (id, nome) FROM stdin;
    public               postgres    false    240   {�       �          0    49230 
   prontuario 
   TABLE DATA           Y   COPY public.prontuario (id, paciente_id, medico_id, descricao, data_criacao) FROM stdin;
    public               postgres    false    242   ��       �          0    49235    prontuario_exame 
   TABLE DATA           C   COPY public.prontuario_exame (prontuario_id, exame_id) FROM stdin;
    public               postgres    false    243   �       �          0    49239    prontuario_medicamento 
   TABLE DATA           O   COPY public.prontuario_medicamento (prontuario_id, medicamento_id) FROM stdin;
    public               postgres    false    245   1�       �          0    49242    receita 
   TABLE DATA           _   COPY public.receita (id, prontuario_id, data_receita, validade, descricao, status) FROM stdin;
    public               postgres    false    246   V�       �          0    49250    receita_medicamento 
   TABLE DATA           U   COPY public.receita_medicamento (receita_id, medicamento_id, quantidade) FROM stdin;
    public               postgres    false    248   ��       �          0    49253    recepcionista 
   TABLE DATA           7   COPY public.recepcionista (id, usuario_id) FROM stdin;
    public               postgres    false    249   ��       �          0    49257    usuario 
   TABLE DATA           S   COPY public.usuario (id, nome, username, senha, perfil_id, email, cpf) FROM stdin;
    public               postgres    false    251   ��                  0    0    agendamento_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.agendamento_id_seq', 1, true);
          public               postgres    false    218                       0    0    atestado_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.atestado_id_seq', 2, true);
          public               postgres    false    220                       0    0    declaracao_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.declaracao_id_seq', 2, true);
          public               postgres    false    222                       0    0    enfermeiro_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.enfermeiro_id_seq', 1, false);
          public               postgres    false    224            	           0    0    especialidade_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.especialidade_id_seq', 3, true);
          public               postgres    false    226            
           0    0    exame_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.exame_id_seq', 2, true);
          public               postgres    false    228                       0    0    historico_atendimento_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.historico_atendimento_id_seq', 1, true);
          public               postgres    false    230                       0    0    log_usuario_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.log_usuario_id_seq', 3, true);
          public               postgres    false    232                       0    0    medicamento_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.medicamento_id_seq', 3, true);
          public               postgres    false    234                       0    0    medico_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.medico_id_seq', 2, true);
          public               postgres    false    237                       0    0    paciente_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.paciente_id_seq', 2, true);
          public               postgres    false    239                       0    0    perfil_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.perfil_id_seq', 4, true);
          public               postgres    false    241                       0    0    prontuario_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.prontuario_id_seq', 1, true);
          public               postgres    false    244                       0    0    receita_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.receita_id_seq', 1, true);
          public               postgres    false    247                       0    0    recepcionista_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.recepcionista_id_seq', 1, false);
          public               postgres    false    250                       0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usuario_id_seq', 5, true);
          public               postgres    false    252            �           2606    49280    agendamento agendamento_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT agendamento_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.agendamento DROP CONSTRAINT agendamento_pkey;
       public                 postgres    false    217            �           2606    49282    atestado atestado_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.atestado
    ADD CONSTRAINT atestado_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.atestado DROP CONSTRAINT atestado_pkey;
       public                 postgres    false    219            �           2606    49284    declaracao declaracao_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.declaracao
    ADD CONSTRAINT declaracao_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.declaracao DROP CONSTRAINT declaracao_pkey;
       public                 postgres    false    221            �           2606    49286    enfermeiro enfermeiro_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.enfermeiro
    ADD CONSTRAINT enfermeiro_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.enfermeiro DROP CONSTRAINT enfermeiro_pkey;
       public                 postgres    false    223            �           2606    49288     especialidade especialidade_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.especialidade
    ADD CONSTRAINT especialidade_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.especialidade DROP CONSTRAINT especialidade_pkey;
       public                 postgres    false    225                       2606    49290    exame exame_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.exame
    ADD CONSTRAINT exame_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.exame DROP CONSTRAINT exame_pkey;
       public                 postgres    false    227                       2606    49292 0   historico_atendimento historico_atendimento_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.historico_atendimento
    ADD CONSTRAINT historico_atendimento_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.historico_atendimento DROP CONSTRAINT historico_atendimento_pkey;
       public                 postgres    false    229                       2606    49294    log_usuario log_usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.log_usuario
    ADD CONSTRAINT log_usuario_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.log_usuario DROP CONSTRAINT log_usuario_pkey;
       public                 postgres    false    231                       2606    49296    medicamento medicamento_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.medicamento
    ADD CONSTRAINT medicamento_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.medicamento DROP CONSTRAINT medicamento_pkey;
       public                 postgres    false    233                       2606    49298 .   medico_especialidade medico_especialidade_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.medico_especialidade
    ADD CONSTRAINT medico_especialidade_pkey PRIMARY KEY (medico_id, especialidade_id);
 X   ALTER TABLE ONLY public.medico_especialidade DROP CONSTRAINT medico_especialidade_pkey;
       public                 postgres    false    236    236            	           2606    49300    medico medico_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.medico DROP CONSTRAINT medico_pkey;
       public                 postgres    false    235                       2606    49302    paciente paciente_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.paciente DROP CONSTRAINT paciente_pkey;
       public                 postgres    false    238                       2606    49304    perfil perfil_nome_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_nome_key UNIQUE (nome);
 @   ALTER TABLE ONLY public.perfil DROP CONSTRAINT perfil_nome_key;
       public                 postgres    false    240                       2606    49306    perfil perfil_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.perfil DROP CONSTRAINT perfil_pkey;
       public                 postgres    false    240                       2606    49308 &   prontuario_exame prontuario_exame_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.prontuario_exame
    ADD CONSTRAINT prontuario_exame_pkey PRIMARY KEY (prontuario_id, exame_id);
 P   ALTER TABLE ONLY public.prontuario_exame DROP CONSTRAINT prontuario_exame_pkey;
       public                 postgres    false    243    243                       2606    49310 2   prontuario_medicamento prontuario_medicamento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.prontuario_medicamento
    ADD CONSTRAINT prontuario_medicamento_pkey PRIMARY KEY (prontuario_id, medicamento_id);
 \   ALTER TABLE ONLY public.prontuario_medicamento DROP CONSTRAINT prontuario_medicamento_pkey;
       public                 postgres    false    245    245                       2606    49312    prontuario prontuario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.prontuario
    ADD CONSTRAINT prontuario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.prontuario DROP CONSTRAINT prontuario_pkey;
       public                 postgres    false    242                       2606    49314 ,   receita_medicamento receita_medicamento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.receita_medicamento
    ADD CONSTRAINT receita_medicamento_pkey PRIMARY KEY (receita_id, medicamento_id);
 V   ALTER TABLE ONLY public.receita_medicamento DROP CONSTRAINT receita_medicamento_pkey;
       public                 postgres    false    248    248                       2606    49316    receita receita_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.receita
    ADD CONSTRAINT receita_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.receita DROP CONSTRAINT receita_pkey;
       public                 postgres    false    246                       2606    49318     recepcionista recepcionista_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.recepcionista
    ADD CONSTRAINT recepcionista_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.recepcionista DROP CONSTRAINT recepcionista_pkey;
       public                 postgres    false    249                       2606    49320    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    251            !           2606    49322    usuario usuario_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_username_key UNIQUE (username);
 F   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_username_key;
       public                 postgres    false    251            "           2606    49323 &   agendamento agendamento_medico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT agendamento_medico_id_fkey FOREIGN KEY (medico_id) REFERENCES public.medico(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.agendamento DROP CONSTRAINT agendamento_medico_id_fkey;
       public               postgres    false    235    4873    217            #           2606    49328 (   agendamento agendamento_paciente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT agendamento_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.paciente(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.agendamento DROP CONSTRAINT agendamento_paciente_id_fkey;
       public               postgres    false    4877    238    217            $           2606    49333     atestado atestado_medico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atestado
    ADD CONSTRAINT atestado_medico_id_fkey FOREIGN KEY (medico_id) REFERENCES public.medico(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.atestado DROP CONSTRAINT atestado_medico_id_fkey;
       public               postgres    false    4873    235    219            %           2606    49338 "   atestado atestado_paciente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atestado
    ADD CONSTRAINT atestado_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.paciente(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.atestado DROP CONSTRAINT atestado_paciente_id_fkey;
       public               postgres    false    219    4877    238            &           2606    49343 $   declaracao declaracao_medico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.declaracao
    ADD CONSTRAINT declaracao_medico_id_fkey FOREIGN KEY (medico_id) REFERENCES public.medico(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.declaracao DROP CONSTRAINT declaracao_medico_id_fkey;
       public               postgres    false    235    221    4873            '           2606    49348 &   declaracao declaracao_paciente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.declaracao
    ADD CONSTRAINT declaracao_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.paciente(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.declaracao DROP CONSTRAINT declaracao_paciente_id_fkey;
       public               postgres    false    4877    238    221            (           2606    49353 %   enfermeiro enfermeiro_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enfermeiro
    ADD CONSTRAINT enfermeiro_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.enfermeiro DROP CONSTRAINT enfermeiro_usuario_id_fkey;
       public               postgres    false    4895    251    223            9           2606    49358    usuario fk_perfil    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_perfil FOREIGN KEY (perfil_id) REFERENCES public.perfil(id) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_perfil;
       public               postgres    false    240    4881    251            )           2606    49363 :   historico_atendimento historico_atendimento_medico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historico_atendimento
    ADD CONSTRAINT historico_atendimento_medico_id_fkey FOREIGN KEY (medico_id) REFERENCES public.medico(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.historico_atendimento DROP CONSTRAINT historico_atendimento_medico_id_fkey;
       public               postgres    false    229    235    4873            *           2606    49368 <   historico_atendimento historico_atendimento_paciente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historico_atendimento
    ADD CONSTRAINT historico_atendimento_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.paciente(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.historico_atendimento DROP CONSTRAINT historico_atendimento_paciente_id_fkey;
       public               postgres    false    4877    229    238            +           2606    49373 '   log_usuario log_usuario_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_usuario
    ADD CONSTRAINT log_usuario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.log_usuario DROP CONSTRAINT log_usuario_usuario_id_fkey;
       public               postgres    false    4895    231    251            -           2606    49378 ?   medico_especialidade medico_especialidade_especialidade_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medico_especialidade
    ADD CONSTRAINT medico_especialidade_especialidade_id_fkey FOREIGN KEY (especialidade_id) REFERENCES public.especialidade(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.medico_especialidade DROP CONSTRAINT medico_especialidade_especialidade_id_fkey;
       public               postgres    false    236    225    4863            .           2606    49383 8   medico_especialidade medico_especialidade_medico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medico_especialidade
    ADD CONSTRAINT medico_especialidade_medico_id_fkey FOREIGN KEY (medico_id) REFERENCES public.medico(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.medico_especialidade DROP CONSTRAINT medico_especialidade_medico_id_fkey;
       public               postgres    false    236    4873    235            ,           2606    49388    medico medico_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.medico DROP CONSTRAINT medico_usuario_id_fkey;
       public               postgres    false    4895    251    235            1           2606    49393 /   prontuario_exame prontuario_exame_exame_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prontuario_exame
    ADD CONSTRAINT prontuario_exame_exame_id_fkey FOREIGN KEY (exame_id) REFERENCES public.exame(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.prontuario_exame DROP CONSTRAINT prontuario_exame_exame_id_fkey;
       public               postgres    false    227    4865    243            2           2606    49398 4   prontuario_exame prontuario_exame_prontuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prontuario_exame
    ADD CONSTRAINT prontuario_exame_prontuario_id_fkey FOREIGN KEY (prontuario_id) REFERENCES public.prontuario(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.prontuario_exame DROP CONSTRAINT prontuario_exame_prontuario_id_fkey;
       public               postgres    false    242    4883    243            3           2606    49403 A   prontuario_medicamento prontuario_medicamento_medicamento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prontuario_medicamento
    ADD CONSTRAINT prontuario_medicamento_medicamento_id_fkey FOREIGN KEY (medicamento_id) REFERENCES public.medicamento(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.prontuario_medicamento DROP CONSTRAINT prontuario_medicamento_medicamento_id_fkey;
       public               postgres    false    245    4871    233            4           2606    49408 @   prontuario_medicamento prontuario_medicamento_prontuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prontuario_medicamento
    ADD CONSTRAINT prontuario_medicamento_prontuario_id_fkey FOREIGN KEY (prontuario_id) REFERENCES public.prontuario(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.prontuario_medicamento DROP CONSTRAINT prontuario_medicamento_prontuario_id_fkey;
       public               postgres    false    242    245    4883            /           2606    49413 $   prontuario prontuario_medico_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prontuario
    ADD CONSTRAINT prontuario_medico_id_fkey FOREIGN KEY (medico_id) REFERENCES public.medico(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.prontuario DROP CONSTRAINT prontuario_medico_id_fkey;
       public               postgres    false    4873    235    242            0           2606    49418 &   prontuario prontuario_paciente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prontuario
    ADD CONSTRAINT prontuario_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.paciente(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.prontuario DROP CONSTRAINT prontuario_paciente_id_fkey;
       public               postgres    false    238    242    4877            6           2606    49423 ;   receita_medicamento receita_medicamento_medicamento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receita_medicamento
    ADD CONSTRAINT receita_medicamento_medicamento_id_fkey FOREIGN KEY (medicamento_id) REFERENCES public.medicamento(id) ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.receita_medicamento DROP CONSTRAINT receita_medicamento_medicamento_id_fkey;
       public               postgres    false    233    248    4871            7           2606    49428 7   receita_medicamento receita_medicamento_receita_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receita_medicamento
    ADD CONSTRAINT receita_medicamento_receita_id_fkey FOREIGN KEY (receita_id) REFERENCES public.receita(id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.receita_medicamento DROP CONSTRAINT receita_medicamento_receita_id_fkey;
       public               postgres    false    4889    246    248            5           2606    49433 "   receita receita_prontuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receita
    ADD CONSTRAINT receita_prontuario_id_fkey FOREIGN KEY (prontuario_id) REFERENCES public.prontuario(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.receita DROP CONSTRAINT receita_prontuario_id_fkey;
       public               postgres    false    246    4883    242            8           2606    49438 +   recepcionista recepcionista_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recepcionista
    ADD CONSTRAINT recepcionista_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.recepcionista DROP CONSTRAINT recepcionista_usuario_id_fkey;
       public               postgres    false    4895    251    249            �   -   x�3�4B##S]]#3K+ �tLO�KIL������ ��)      �   �   x���Q
�0D��S�*M���=��f�h�!	��Sx1?e�gf�y�S�4��!�ݵK�`��
�s��]����=3X�4g4{X�*U�U6�*?H�>�v�G����l��Zi� !�®�����v�޿ �=F�      �   �   x��N1�0��W�Z��X`9�C��$�I�!���ƚ�q�"!!���l��*���u^�r�dkR����A��Gע%�l�h�<��띉~X$�]LW7�o��i���K}��Z�l��=�]�}	68�mg&2\�=[�&{o�BD�ا[ v�e%s�H��'�����#v����o3      �      x������ � �      �   /   x�3�tN,J����O�L�2�HM�L,)��9��J�@|�=... /�      �   u   x�3�t�H�MUHIUN�K/M����R�2�2����-K�,)K��I-.I-���QH��L�/N�QH-I��2�J��׍@�������nXZQbIiQb�����ũ��\1z\\\ 1�0f      �   a   x�3�4B����Ҝ�D��Ģ����Û�3����\���������/�WHIU�MMJ���+�*�V � ��ļ��TN##S]]#S�=... � �      �   �   x�}�9�0@�z|��@"�Y�tс(hiF���yL.�Q�KI��7_z���cBa).Xm�J���Q�A��f۵FY���]�(�XN�����7#��3e&�x^�U����E^�H�I�)���>	^�/�ܭVJ�Q<=      �   E   x�3�t,.�,��K�450�M��/J��2�H,JLN-I����42�Ksz&�姥��s!4��qqq x�K      �   !   x�3�4�44261�2�4�43��4������ 1P�      �      x�3�4�2�4�2�4����� +      �   Z   x�3�tN,��/V��)K�*MTp�4426�553��4��0�50".#N�Ģ�D��̲��"�Z'NKs3]Sc#�ZK�Z# ����� >��      �   B   x�3�tL����,.)JL�/�2��=�2%39�˘�5/-�(75�(�˄3(59� 93�4�+F��� t[�      �   3   x�3�4B����Ҝ�D��Ģ����Û�3�9��LuLt�L�b���� <�      �      x�3�4����� ]      �      x�3�4�2�4����� ��      �   M   x�3�4�4202�50�52�2MA̠���̒D��ĢD���Ē��Լ�|��T��̂Ԣ�Լ�Ë�9K2��b���� o�      �      x�3�4�46�2�4�42������ k      �      x������ � �      �   �   x�m��N�@D����-�z�����	Q(h&��;{��	�ç�cX+:S�4#��LFW�V7���T�[�ԡAfsʈ�1�/'�$v���z�G���]\�r������}Ǣ��� ��k�ʳs�'��y�Z��� �%�#@n����xc�>JMç ,�Z��I��mw~s;,*n�ǲ-ܪ�u��7�<��/춲��a�k����$��5T�     