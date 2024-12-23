PGDMP      ;            
    |            GESTDEPBD_1    16.4    16.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16399    GESTDEPBD_1    DATABASE     �   CREATE DATABASE "GESTDEPBD_1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "GESTDEPBD_1";
                angela    false            �            1259    16471    card    TABLE     �   CREATE TABLE public.card (
    card_id integer NOT NULL,
    card_color character varying(10),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.card;
       public         heap    postgres    false            �            1259    16470    Card_card_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Card_card_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Card_card_id_seq";
       public          postgres    false    234            �           0    0    Card_card_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Card_card_id_seq" OWNED BY public.card.card_id;
          public          postgres    false    233            �            1259    16436    category    TABLE     �   CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(30),
    championship_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16435    Category_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Category_category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Category_category_id_seq";
       public          postgres    false    226            �           0    0    Category_category_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Category_category_id_seq" OWNED BY public.category.category_id;
          public          postgres    false    225            �            1259    16515    champion_game    TABLE     �   CREATE TABLE public.champion_game (
    id_c integer NOT NULL,
    game_id integer,
    championship_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.champion_game;
       public         heap    postgres    false            �            1259    16514    Champion_game_id_c_seq    SEQUENCE     �   CREATE SEQUENCE public."Champion_game_id_c_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Champion_game_id_c_seq";
       public          postgres    false    246            �           0    0    Champion_game_id_c_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Champion_game_id_c_seq" OWNED BY public.champion_game.id_c;
          public          postgres    false    245            �            1259    16457    champion_team    TABLE     �   CREATE TABLE public.champion_team (
    id integer NOT NULL,
    team_id integer,
    championship_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.champion_team;
       public         heap    postgres    false            �            1259    16456    Champion_team_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Champion_team_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Champion_team_id_seq";
       public          postgres    false    230            �           0    0    Champion_team_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Champion_team_id_seq" OWNED BY public.champion_team.id;
          public          postgres    false    229            �            1259    16429    championship    TABLE     �   CREATE TABLE public.championship (
    championship_id integer NOT NULL,
    championship_name character varying(30),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.championship;
       public         heap    postgres    false            �            1259    16428     Championship_championship_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Championship_championship_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."Championship_championship_id_seq";
       public          postgres    false    224            �           0    0     Championship_championship_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."Championship_championship_id_seq" OWNED BY public.championship.championship_id;
          public          postgres    false    223            �            1259    16464 
   chronology    TABLE       CREATE TABLE public.chronology (
    id_chronology integer NOT NULL,
    card_id integer,
    game_id integer,
    goal_number integer,
    g_id integer,
    id_player integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.chronology;
       public         heap    postgres    false            �            1259    16463    Chronology_id_chronology_seq    SEQUENCE     �   CREATE SEQUENCE public."Chronology_id_chronology_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."Chronology_id_chronology_seq";
       public          postgres    false    232            �           0    0    Chronology_id_chronology_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."Chronology_id_chronology_seq" OWNED BY public.chronology.id_chronology;
          public          postgres    false    231            �            1259    16478    game    TABLE     '  CREATE TABLE public.game (
    game_id integer NOT NULL,
    game_date date,
    start_time time without time zone,
    end_time time without time zone,
    location character varying(255),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.game;
       public         heap    postgres    false            �            1259    16477    Game_game_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Game_game_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Game_game_id_seq";
       public          postgres    false    236            �           0    0    Game_game_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Game_game_id_seq" OWNED BY public.game.game_id;
          public          postgres    false    235            �            1259    16485    game_referee    TABLE     �   CREATE TABLE public.game_referee (
    id_game_referee integer NOT NULL,
    id_referee integer,
    game_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.game_referee;
       public         heap    postgres    false            �            1259    16484     Game_referee_id_game_referee_seq    SEQUENCE     �   CREATE SEQUENCE public."Game_referee_id_game_referee_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."Game_referee_id_game_referee_seq";
       public          postgres    false    238            �           0    0     Game_referee_id_game_referee_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."Game_referee_id_game_referee_seq" OWNED BY public.game_referee.id_game_referee;
          public          postgres    false    237            �            1259    16443    group    TABLE     �   CREATE TABLE public."group" (
    group_id integer NOT NULL,
    group_name character varying(60),
    championship_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."group";
       public         heap    postgres    false            �            1259    16442    Group_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Group_group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Group_group_id_seq";
       public          postgres    false    228            �           0    0    Group_group_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Group_group_id_seq" OWNED BY public."group".group_id;
          public          postgres    false    227            �            1259    16633    phases    TABLE     �   CREATE TABLE public.phases (
    phase_id integer NOT NULL,
    phase_name character varying(60),
    championship_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.phases;
       public         heap    postgres    false            �            1259    16632    Phases_phase_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Phases_phase_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Phases_phase_id_seq";
       public          postgres    false    251            �           0    0    Phases_phase_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Phases_phase_id_seq" OWNED BY public.phases.phase_id;
          public          postgres    false    250            �            1259    16522    player    TABLE     c  CREATE TABLE public.player (
    id_player integer NOT NULL,
    id_card character varying(10),
    firstname character varying(20),
    last_name character varying(20),
    date_of_birth date,
    photo character varying(255),
    gen character(1),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.player;
       public         heap    postgres    false            �            1259    16521    Player_id_player_seq    SEQUENCE     �   CREATE SEQUENCE public."Player_id_player_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Player_id_player_seq";
       public          postgres    false    248            �           0    0    Player_id_player_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Player_id_player_seq" OWNED BY public.player.id_player;
          public          postgres    false    247            �            1259    16492    referee    TABLE     2  CREATE TABLE public.referee (
    id_referee integer NOT NULL,
    name character varying(30),
    last_name character varying(30),
    id_card character varying(30),
    photo character varying(255),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.referee;
       public         heap    postgres    false            �            1259    16491    Referee_id_referee_seq    SEQUENCE     �   CREATE SEQUENCE public."Referee_id_referee_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Referee_id_referee_seq";
       public          postgres    false    240            �           0    0    Referee_id_referee_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Referee_id_referee_seq" OWNED BY public.referee.id_referee;
          public          postgres    false    239            �            1259    16499    referee_report    TABLE     �   CREATE TABLE public.referee_report (
    id integer NOT NULL,
    id_referee integer,
    report_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.referee_report;
       public         heap    postgres    false            �            1259    16498    Referee_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Referee_report_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Referee_report_id_seq";
       public          postgres    false    242            �           0    0    Referee_report_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Referee_report_id_seq" OWNED BY public.referee_report.id;
          public          postgres    false    241            �            1259    16506    report    TABLE     �   CREATE TABLE public.report (
    report_id integer NOT NULL,
    description text,
    game_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.report;
       public         heap    postgres    false            �            1259    16505    Report_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Report_report_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Report_report_id_seq";
       public          postgres    false    244            �           0    0    Report_report_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Report_report_id_seq" OWNED BY public.report.report_id;
          public          postgres    false    243            �            1259    16422    team    TABLE       CREATE TABLE public.team (
    team_id integer NOT NULL,
    team_name character varying(30),
    shirt_color character varying(20),
    id_td integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.team;
       public         heap    postgres    false            �            1259    16421    Team_team_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Team_team_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Team_team_id_seq";
       public          postgres    false    222            �           0    0    Team_team_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Team_team_id_seq" OWNED BY public.team.team_id;
          public          postgres    false    221            �            1259    16401    admin    TABLE     �   CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    id_user integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    16400    admin_id_admin_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_id_admin_seq;
       public          postgres    false    216            �           0    0    admin_id_admin_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;
          public          postgres    false    215            �            1259    16528    team_player    TABLE     �   CREATE TABLE public.team_player (
    id_player integer,
    team_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.team_player;
       public         heap    postgres    false            �            1259    16408    technical_director    TABLE     �   CREATE TABLE public.technical_director (
    id_td integer NOT NULL,
    id_user integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 &   DROP TABLE public.technical_director;
       public         heap    postgres    false            �            1259    16407    technical_director_id_td_seq    SEQUENCE     �   CREATE SEQUENCE public.technical_director_id_td_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.technical_director_id_td_seq;
       public          postgres    false    218            �           0    0    technical_director_id_td_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.technical_director_id_td_seq OWNED BY public.technical_director.id_td;
          public          postgres    false    217            �            1259    16415    user    TABLE     v  CREATE TABLE public."user" (
    id_user integer NOT NULL,
    firstname character varying(30),
    lastname character varying(30),
    id_card character varying(8),
    photo character varying(255),
    password character varying(10),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    email character varying(50)
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16414    user_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_id_user_seq;
       public          postgres    false    220            �           0    0    user_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_id_user_seq OWNED BY public."user".id_user;
          public          postgres    false    219            �           2604    16404    admin id_admin    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN id_admin DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16474    card card_id    DEFAULT     n   ALTER TABLE ONLY public.card ALTER COLUMN card_id SET DEFAULT nextval('public."Card_card_id_seq"'::regclass);
 ;   ALTER TABLE public.card ALTER COLUMN card_id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    16439    category category_id    DEFAULT     ~   ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public."Category_category_id_seq"'::regclass);
 C   ALTER TABLE public.category ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16518    champion_game id_c    DEFAULT     z   ALTER TABLE ONLY public.champion_game ALTER COLUMN id_c SET DEFAULT nextval('public."Champion_game_id_c_seq"'::regclass);
 A   ALTER TABLE public.champion_game ALTER COLUMN id_c DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    16460    champion_team id    DEFAULT     v   ALTER TABLE ONLY public.champion_team ALTER COLUMN id SET DEFAULT nextval('public."Champion_team_id_seq"'::regclass);
 ?   ALTER TABLE public.champion_team ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    16432    championship championship_id    DEFAULT     �   ALTER TABLE ONLY public.championship ALTER COLUMN championship_id SET DEFAULT nextval('public."Championship_championship_id_seq"'::regclass);
 K   ALTER TABLE public.championship ALTER COLUMN championship_id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16467    chronology id_chronology    DEFAULT     �   ALTER TABLE ONLY public.chronology ALTER COLUMN id_chronology SET DEFAULT nextval('public."Chronology_id_chronology_seq"'::regclass);
 G   ALTER TABLE public.chronology ALTER COLUMN id_chronology DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    16481    game game_id    DEFAULT     n   ALTER TABLE ONLY public.game ALTER COLUMN game_id SET DEFAULT nextval('public."Game_game_id_seq"'::regclass);
 ;   ALTER TABLE public.game ALTER COLUMN game_id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    16488    game_referee id_game_referee    DEFAULT     �   ALTER TABLE ONLY public.game_referee ALTER COLUMN id_game_referee SET DEFAULT nextval('public."Game_referee_id_game_referee_seq"'::regclass);
 K   ALTER TABLE public.game_referee ALTER COLUMN id_game_referee DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    16446    group group_id    DEFAULT     t   ALTER TABLE ONLY public."group" ALTER COLUMN group_id SET DEFAULT nextval('public."Group_group_id_seq"'::regclass);
 ?   ALTER TABLE public."group" ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    16636    phases phase_id    DEFAULT     t   ALTER TABLE ONLY public.phases ALTER COLUMN phase_id SET DEFAULT nextval('public."Phases_phase_id_seq"'::regclass);
 >   ALTER TABLE public.phases ALTER COLUMN phase_id DROP DEFAULT;
       public          postgres    false    250    251    251            �           2604    16525    player id_player    DEFAULT     v   ALTER TABLE ONLY public.player ALTER COLUMN id_player SET DEFAULT nextval('public."Player_id_player_seq"'::regclass);
 ?   ALTER TABLE public.player ALTER COLUMN id_player DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    16495    referee id_referee    DEFAULT     z   ALTER TABLE ONLY public.referee ALTER COLUMN id_referee SET DEFAULT nextval('public."Referee_id_referee_seq"'::regclass);
 A   ALTER TABLE public.referee ALTER COLUMN id_referee DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    16502    referee_report id    DEFAULT     x   ALTER TABLE ONLY public.referee_report ALTER COLUMN id SET DEFAULT nextval('public."Referee_report_id_seq"'::regclass);
 @   ALTER TABLE public.referee_report ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    16509    report report_id    DEFAULT     v   ALTER TABLE ONLY public.report ALTER COLUMN report_id SET DEFAULT nextval('public."Report_report_id_seq"'::regclass);
 ?   ALTER TABLE public.report ALTER COLUMN report_id DROP DEFAULT;
       public          postgres    false    243    244    244            �           2604    16425    team team_id    DEFAULT     n   ALTER TABLE ONLY public.team ALTER COLUMN team_id SET DEFAULT nextval('public."Team_team_id_seq"'::regclass);
 ;   ALTER TABLE public.team ALTER COLUMN team_id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16411    technical_director id_td    DEFAULT     �   ALTER TABLE ONLY public.technical_director ALTER COLUMN id_td SET DEFAULT nextval('public.technical_director_id_td_seq'::regclass);
 G   ALTER TABLE public.technical_director ALTER COLUMN id_td DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16418    user id_user    DEFAULT     n   ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);
 =   ALTER TABLE public."user" ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    220    219    220            �          0    16401    admin 
   TABLE DATA           F   COPY public.admin (id_admin, id_user, status, created_at) FROM stdin;
    public          postgres    false    216   �       �          0    16471    card 
   TABLE DATA           G   COPY public.card (card_id, card_color, status, created_at) FROM stdin;
    public          postgres    false    234   S�       �          0    16436    category 
   TABLE DATA           c   COPY public.category (category_id, category_name, championship_id, status, created_at) FROM stdin;
    public          postgres    false    226   ӻ       �          0    16515    champion_game 
   TABLE DATA           [   COPY public.champion_game (id_c, game_id, championship_id, status, created_at) FROM stdin;
    public          postgres    false    246   ��       �          0    16457    champion_team 
   TABLE DATA           Y   COPY public.champion_team (id, team_id, championship_id, status, created_at) FROM stdin;
    public          postgres    false    230   @�       �          0    16429    championship 
   TABLE DATA           ^   COPY public.championship (championship_id, championship_name, status, created_at) FROM stdin;
    public          postgres    false    224   Ľ       �          0    16464 
   chronology 
   TABLE DATA           w   COPY public.chronology (id_chronology, card_id, game_id, goal_number, g_id, id_player, status, created_at) FROM stdin;
    public          postgres    false    232   ؾ       �          0    16478    game 
   TABLE DATA           f   COPY public.game (game_id, game_date, start_time, end_time, location, status, created_at) FROM stdin;
    public          postgres    false    236   d�       �          0    16485    game_referee 
   TABLE DATA           `   COPY public.game_referee (id_game_referee, id_referee, game_id, status, created_at) FROM stdin;
    public          postgres    false    238   �       �          0    16443    group 
   TABLE DATA           \   COPY public."group" (group_id, group_name, championship_id, status, created_at) FROM stdin;
    public          postgres    false    228   �       �          0    16633    phases 
   TABLE DATA           [   COPY public.phases (phase_id, phase_name, championship_id, status, created_at) FROM stdin;
    public          postgres    false    251   ��       �          0    16522    player 
   TABLE DATA           y   COPY public.player (id_player, id_card, firstname, last_name, date_of_birth, photo, gen, status, created_at) FROM stdin;
    public          postgres    false    248   I�       �          0    16492    referee 
   TABLE DATA           b   COPY public.referee (id_referee, name, last_name, id_card, photo, status, created_at) FROM stdin;
    public          postgres    false    240   ��       �          0    16499    referee_report 
   TABLE DATA           W   COPY public.referee_report (id, id_referee, report_id, status, created_at) FROM stdin;
    public          postgres    false    242   2�       �          0    16506    report 
   TABLE DATA           U   COPY public.report (report_id, description, game_id, status, created_at) FROM stdin;
    public          postgres    false    244   ��       �          0    16422    team 
   TABLE DATA           Z   COPY public.team (team_id, team_name, shirt_color, id_td, status, created_at) FROM stdin;
    public          postgres    false    222   ��       �          0    16528    team_player 
   TABLE DATA           M   COPY public.team_player (id_player, team_id, status, created_at) FROM stdin;
    public          postgres    false    249   �       �          0    16408    technical_director 
   TABLE DATA           P   COPY public.technical_director (id_td, id_user, status, created_at) FROM stdin;
    public          postgres    false    218   ��       �          0    16415    user 
   TABLE DATA           s   COPY public."user" (id_user, firstname, lastname, id_card, photo, password, status, created_at, email) FROM stdin;
    public          postgres    false    220   '�       �           0    0    Card_card_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Card_card_id_seq"', 20, true);
          public          postgres    false    233            �           0    0    Category_category_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Category_category_id_seq"', 13, true);
          public          postgres    false    225            �           0    0    Champion_game_id_c_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Champion_game_id_c_seq"', 40, true);
          public          postgres    false    245            �           0    0    Champion_team_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Champion_team_id_seq"', 1, true);
          public          postgres    false    229            �           0    0     Championship_championship_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Championship_championship_id_seq"', 1, false);
          public          postgres    false    223            �           0    0    Chronology_id_chronology_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."Chronology_id_chronology_seq"', 20, true);
          public          postgres    false    231            �           0    0    Game_game_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Game_game_id_seq"', 20, true);
          public          postgres    false    235            �           0    0     Game_referee_id_game_referee_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Game_referee_id_game_referee_seq"', 40, true);
          public          postgres    false    237            �           0    0    Group_group_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Group_group_id_seq"', 1, true);
          public          postgres    false    227            �           0    0    Phases_phase_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Phases_phase_id_seq"', 8, true);
          public          postgres    false    250            �           0    0    Player_id_player_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Player_id_player_seq"', 20, true);
          public          postgres    false    247            �           0    0    Referee_id_referee_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Referee_id_referee_seq"', 20, true);
          public          postgres    false    239            �           0    0    Referee_report_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Referee_report_id_seq"', 80, true);
          public          postgres    false    241            �           0    0    Report_report_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Report_report_id_seq"', 20, true);
          public          postgres    false    243            �           0    0    Team_team_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Team_team_id_seq"', 1, true);
          public          postgres    false    221            �           0    0    admin_id_admin_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, false);
          public          postgres    false    215            �           0    0    technical_director_id_td_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.technical_director_id_td_seq', 1, false);
          public          postgres    false    217            �           0    0    user_id_user_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_id_user_seq', 9, true);
          public          postgres    false    219            �           2606    16476    card Card_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.card
    ADD CONSTRAINT "Card_pkey" PRIMARY KEY (card_id);
 :   ALTER TABLE ONLY public.card DROP CONSTRAINT "Card_pkey";
       public            postgres    false    234            �           2606    16441    category Category_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.category
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (category_id);
 B   ALTER TABLE ONLY public.category DROP CONSTRAINT "Category_pkey";
       public            postgres    false    226                        2606    16520     champion_game Champion_game_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.champion_game
    ADD CONSTRAINT "Champion_game_pkey" PRIMARY KEY (id_c);
 L   ALTER TABLE ONLY public.champion_game DROP CONSTRAINT "Champion_game_pkey";
       public            postgres    false    246            �           2606    16462     champion_team Champion_team_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.champion_team
    ADD CONSTRAINT "Champion_team_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.champion_team DROP CONSTRAINT "Champion_team_pkey";
       public            postgres    false    230            �           2606    16434    championship Championship_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.championship
    ADD CONSTRAINT "Championship_pkey" PRIMARY KEY (championship_id);
 J   ALTER TABLE ONLY public.championship DROP CONSTRAINT "Championship_pkey";
       public            postgres    false    224            �           2606    16469    chronology Chronology_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.chronology
    ADD CONSTRAINT "Chronology_pkey" PRIMARY KEY (id_chronology);
 F   ALTER TABLE ONLY public.chronology DROP CONSTRAINT "Chronology_pkey";
       public            postgres    false    232            �           2606    16483    game Game_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.game
    ADD CONSTRAINT "Game_pkey" PRIMARY KEY (game_id);
 :   ALTER TABLE ONLY public.game DROP CONSTRAINT "Game_pkey";
       public            postgres    false    236            �           2606    16490    game_referee Game_referee_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.game_referee
    ADD CONSTRAINT "Game_referee_pkey" PRIMARY KEY (id_game_referee);
 J   ALTER TABLE ONLY public.game_referee DROP CONSTRAINT "Game_referee_pkey";
       public            postgres    false    238            �           2606    16448    group Group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY (group_id);
 >   ALTER TABLE ONLY public."group" DROP CONSTRAINT "Group_pkey";
       public            postgres    false    228                       2606    16638    phases Phases_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.phases
    ADD CONSTRAINT "Phases_pkey" PRIMARY KEY (phase_id);
 >   ALTER TABLE ONLY public.phases DROP CONSTRAINT "Phases_pkey";
       public            postgres    false    251                       2606    16527    player Player_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.player
    ADD CONSTRAINT "Player_pkey" PRIMARY KEY (id_player);
 >   ALTER TABLE ONLY public.player DROP CONSTRAINT "Player_pkey";
       public            postgres    false    248            �           2606    16497    referee Referee_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.referee
    ADD CONSTRAINT "Referee_pkey" PRIMARY KEY (id_referee);
 @   ALTER TABLE ONLY public.referee DROP CONSTRAINT "Referee_pkey";
       public            postgres    false    240            �           2606    16504 "   referee_report Referee_report_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.referee_report
    ADD CONSTRAINT "Referee_report_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.referee_report DROP CONSTRAINT "Referee_report_pkey";
       public            postgres    false    242            �           2606    16513    report Report_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.report
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (report_id);
 >   ALTER TABLE ONLY public.report DROP CONSTRAINT "Report_pkey";
       public            postgres    false    244            �           2606    16427    team Team_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.team
    ADD CONSTRAINT "Team_pkey" PRIMARY KEY (team_id);
 :   ALTER TABLE ONLY public.team DROP CONSTRAINT "Team_pkey";
       public            postgres    false    222            �           2606    16406    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    216            �           2606    16413 *   technical_director technical_director_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.technical_director
    ADD CONSTRAINT technical_director_pkey PRIMARY KEY (id_td);
 T   ALTER TABLE ONLY public.technical_director DROP CONSTRAINT technical_director_pkey;
       public            postgres    false    218            �           2606    16420    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    220                       2606    16541 &   category Category_championship_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.category
    ADD CONSTRAINT "Category_championship_id_fkey" FOREIGN KEY (championship_id) REFERENCES public.championship(championship_id);
 R   ALTER TABLE ONLY public.category DROP CONSTRAINT "Category_championship_id_fkey";
       public          postgres    false    4842    226    224                       2606    16571 0   champion_game Champion_game_championship_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.champion_game
    ADD CONSTRAINT "Champion_game_championship_id_fkey" FOREIGN KEY (championship_id) REFERENCES public.championship(championship_id);
 \   ALTER TABLE ONLY public.champion_game DROP CONSTRAINT "Champion_game_championship_id_fkey";
       public          postgres    false    246    224    4842                       2606    16576 (   champion_game Champion_game_game_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.champion_game
    ADD CONSTRAINT "Champion_game_game_id_fkey" FOREIGN KEY (game_id) REFERENCES public.game(game_id);
 T   ALTER TABLE ONLY public.champion_game DROP CONSTRAINT "Champion_game_game_id_fkey";
       public          postgres    false    246    236    4854            
           2606    16561 0   champion_team Champion_team_championship_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.champion_team
    ADD CONSTRAINT "Champion_team_championship_id_fkey" FOREIGN KEY (championship_id) REFERENCES public.championship(championship_id);
 \   ALTER TABLE ONLY public.champion_team DROP CONSTRAINT "Champion_team_championship_id_fkey";
       public          postgres    false    224    4842    230                       2606    16556 (   champion_team Champion_team_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.champion_team
    ADD CONSTRAINT "Champion_team_team_id_fkey" FOREIGN KEY (team_id) REFERENCES public.team(team_id);
 T   ALTER TABLE ONLY public.champion_team DROP CONSTRAINT "Champion_team_team_id_fkey";
       public          postgres    false    4840    230    222                       2606    16566 "   chronology Chronology_card_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chronology
    ADD CONSTRAINT "Chronology_card_id_fkey" FOREIGN KEY (card_id) REFERENCES public.card(card_id);
 N   ALTER TABLE ONLY public.chronology DROP CONSTRAINT "Chronology_card_id_fkey";
       public          postgres    false    234    4852    232                       2606    16531    chronology Chronology_g_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chronology
    ADD CONSTRAINT "Chronology_g_id_fkey" FOREIGN KEY (g_id) REFERENCES public.game(game_id);
 K   ALTER TABLE ONLY public.chronology DROP CONSTRAINT "Chronology_g_id_fkey";
       public          postgres    false    236    232    4854                       2606    16626 $   chronology Chronology_id_player_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chronology
    ADD CONSTRAINT "Chronology_id_player_fkey" FOREIGN KEY (id_player) REFERENCES public.player(id_player);
 P   ALTER TABLE ONLY public.chronology DROP CONSTRAINT "Chronology_id_player_fkey";
       public          postgres    false    232    4866    248                       2606    16591 &   game_referee Game_referee_game_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.game_referee
    ADD CONSTRAINT "Game_referee_game_id_fkey" FOREIGN KEY (game_id) REFERENCES public.game(game_id);
 R   ALTER TABLE ONLY public.game_referee DROP CONSTRAINT "Game_referee_game_id_fkey";
       public          postgres    false    236    238    4854                       2606    16596 )   game_referee Game_referee_id_referee_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.game_referee
    ADD CONSTRAINT "Game_referee_id_referee_fkey" FOREIGN KEY (id_referee) REFERENCES public.referee(id_referee);
 U   ALTER TABLE ONLY public.game_referee DROP CONSTRAINT "Game_referee_id_referee_fkey";
       public          postgres    false    4858    238    240            	           2606    16546     group Group_championship_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."group"
    ADD CONSTRAINT "Group_championship_id_fkey" FOREIGN KEY (championship_id) REFERENCES public.championship(championship_id);
 N   ALTER TABLE ONLY public."group" DROP CONSTRAINT "Group_championship_id_fkey";
       public          postgres    false    4842    228    224                       2606    16606 -   referee_report Referee_report_id_referee_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referee_report
    ADD CONSTRAINT "Referee_report_id_referee_fkey" FOREIGN KEY (id_referee) REFERENCES public.referee(id_referee);
 Y   ALTER TABLE ONLY public.referee_report DROP CONSTRAINT "Referee_report_id_referee_fkey";
       public          postgres    false    4858    242    240                       2606    16601 ,   referee_report Referee_report_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referee_report
    ADD CONSTRAINT "Referee_report_report_id_fkey" FOREIGN KEY (report_id) REFERENCES public.report(report_id);
 X   ALTER TABLE ONLY public.referee_report DROP CONSTRAINT "Referee_report_report_id_fkey";
       public          postgres    false    242    244    4862                       2606    16536    report Report_game_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.report
    ADD CONSTRAINT "Report_game_id_fkey" FOREIGN KEY (game_id) REFERENCES public.game(game_id);
 F   ALTER TABLE ONLY public.report DROP CONSTRAINT "Report_game_id_fkey";
       public          postgres    false    4854    244    236                       2606    16621    team Team_id_td_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.team
    ADD CONSTRAINT "Team_id_td_fkey" FOREIGN KEY (id_td) REFERENCES public.technical_director(id_td);
 @   ALTER TABLE ONLY public.team DROP CONSTRAINT "Team_id_td_fkey";
       public          postgres    false    222    4836    218                       2606    16611    admin admin_id_user_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user);
 B   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_id_user_fkey;
       public          postgres    false    4838    216    220                       2606    16641    phases fk_championship_phases    FK CONSTRAINT     �   ALTER TABLE ONLY public.phases
    ADD CONSTRAINT fk_championship_phases FOREIGN KEY (championship_id) REFERENCES public.championship(championship_id);
 G   ALTER TABLE ONLY public.phases DROP CONSTRAINT fk_championship_phases;
       public          postgres    false    251    224    4842                       2606    16586 &   team_player team_player_id_player_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.team_player
    ADD CONSTRAINT team_player_id_player_fkey FOREIGN KEY (id_player) REFERENCES public.player(id_player);
 P   ALTER TABLE ONLY public.team_player DROP CONSTRAINT team_player_id_player_fkey;
       public          postgres    false    249    4866    248                       2606    16581 $   team_player team_player_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.team_player
    ADD CONSTRAINT team_player_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team(team_id);
 N   ALTER TABLE ONLY public.team_player DROP CONSTRAINT team_player_team_id_fkey;
       public          postgres    false    4840    222    249                       2606    16616 2   technical_director technical_director_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.technical_director
    ADD CONSTRAINT technical_director_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user);
 \   ALTER TABLE ONLY public.technical_director DROP CONSTRAINT technical_director_id_user_fkey;
       public          postgres    false    4838    218    220            �   .   x�3�4�,�4202�54�54S04�25�25�341�06����� ���      �   p   x��л�0���
��=0.��g�H�h���d�<b��Cp(b˩�⑬FS���q��U�C���*�ΡJA�B�$���� ��;b9�� ���b�q�O���d��      �   �   x���;�0�z}
. �?|Z�@�*������8�����h�AX��-dwB��[�-��d�dl��E���O!G�*��~��|����@��5r��ȱ�2������CYIЌC�]����k��&�&�����1�U׊#9#9���sr      �   �   x�����0�t�@K�������c�՟ 8�yc�w_x��Y�l},�9�v~�7G�*�UrT��Qe!G�9���Q�B�*�Qp������
nM�Z(�u��։�[
�dG�-��v�ow�pw�q"w��*��*��*��*��*��!U�쭵��      �   t   x�}л�@Q�7
�Zi?,�B�B�Դ��1����w�����=�=�a�W���$i�$��$�$��$9�I��Ir��*�V�_Z9�V�L�N�� �j�iu�i�ȴ�Ȥz�R���~�      �     x����n� ���S��8���BuU)��]���HX޿���R���;����i$2��Q�HX,ڒ�e�#gM�2/ѻm� �fE�M{3��,q���v��bR�
^]�<5�V֨m���
�م�����9}\`�z��ڬ��/$�"�ou��_�ww��$�a�d.�5:�����8��q��K��Y
):�s�
D'��j�G������f�����Xm��~�N$`]��Z7����n����mJz�>�,�~ f�t      �   |   x�}ӻ�@�x�
7 ����ZT����0��N�2�������fu���v�~��[�ռ81	1	;1	1	'1	b.b��$�JJ��0�i�4o�4�4�4��4?Hi�Hi~���QII~凜����      �     x����j�0е�����$?�M�Ϥ鲛@�0����_A�^�xq� q��	���k�q J���7���q�|[����G��㊛!�!�5{��(��vQ�L�芇�q�L9Օ %�r�+Jt��L9וJ�8,J�)��A锎.u���+]�
�ä�tm0���nF��Rӭ�`�)�{�38�rQ���Xn��`0��MmN����`0��M=V�b����V,�4�d�O����vz�/���<~M������gm$�      �   }   x�}б�0C��"�'P�,{����/��w|��~�y�\�g�3�Ɍ=�E@�f@�&�y3�y��ysA�fC��f��`����ʫ +�Xy�`��+�Xyu��W����ʪ��UY�=[k���      �   �   x���7�@DѸu
]@*�jW.�
�C� E��Q0��d?x�'�����g �U���M�zHqHM��:dA�����jF�KD&�+$6�hl�
�ڰ�Ag�^��Y��aJ�R�t�P�@�u�tQ�@�u�t.Q7]@�u�tNQW�@�u�tn����M�e�e�f��      �   m   x�3�t�I,�L�LN,�/�L�4�,�4202�54�54S04�25�25�341�06�2�t.M,*�/VHIUH��K�!�Ø3857�(�&�n�(3%��f$�ٜx7[��=... "US�      �   =  x����n�0���S���e˹�]֮H�b-�K/jc�d�P��ӏL��0`0������IJ���=<�����R%a���&��v��(�J�R`�	��.��c�L�f�9
���w��8���G����)`����ta=GRdD1)*.�/�'�L*�w'g��z�3���@5���f�����M��ugj!�PF�`*�T���4mHS��=�&k�͈�rP5�j���o��>ۓ��5�?�����a�!=�lz�?Ҥ�l�#��p�4��[���tp�������{�590�D�ro�@S����W\%d%Ԥe���:���M���G��_{!f���T�ong��uFМ4Le���Ⱦw�w1|X�F;���2̲>������|ź"�5-����|*�c���y�1�$�
'X����O嶳��á��.��mk��b�ee 9TlO�kcjyd�۔S��ι;��2�	x�g������f�h�*��;uw7��5����9���<y�0���S�Ȕ̢!�>�S�M�"�G����J���_D��z!��1بb�:��f���1      �   �  x���Kn�0����� (�<�Z�������M7.q��G�����D�2�F�5��;#;8��I����/��gp�R��0�a��٪�WE9ǜUK��E�x0��J6]f��4�Xs]F]6��ƞ��������i{n/��W5PWPWLw%M[nO�SWRWNw�ͧ�ޕ���t1�V��`o�VV�ᒆi�[8�6�>Kj��-��6<w�����3��F��:In8J�r:1>E@Bk�j��;~���&�Є�78�^»T�.�F���[����`�)�@��_�G���s�
�]�K�N��t�~|��#���uN��?Q�0V�k;i������>p�o����nȺ�0��r,��W��Z�o�NY �"�}̓$�*)C      �   }   x�}���0Cѳ\EH��;�e���'�4�7މ rX7?�O���Lf\t��Zr��q䴙�i�i���f#�͍�4���Vߟ+���`����V��
��j��V����J�ݿk&��j���c��      �   �   x��һ�0 �ڞ���Q�i�ą����H!b%�;���{NL���>��~�I3a�L�#�#��$[�Q*��b������@�\An �A��4P�`�`m`탭�����
��> h�`�Ǡ��vz��1�q���1�q���1�q£�1�qڣ�1�q��1��.�y g��8�~ �q>x.�8����s      �   d  x����n�0�Ͽ�"/���e;ɱi���6h�v!V�V�H����O�q�*|$H~�?m�#���	UY�;*�]P�i̦i�d�U]�m/:��]U�q/�'�Ӱ�!������7Lo�Ƚ�y�sD��[����`'A��;��Oü櫲�]�`�7>O!򻋞�`���xP��?)߰N�Tbg��yY��!]@�e���q돠�T����~�Flo�g�R���u��3��'e�����W���(����tQ�xu�*��ajq`U;Kxv��d��b��1���?��V��e��9Ϭ!�;e4��!&)������ʘ�Jl#/��b��xq[x�5��/�۔fS6�uW����EQ�k�U      �   �   x��л1�xU�����>�Z\���; ���E��G�-.��|�g��&l�5����9E�F�f�V�v=9�뷜 ���(z�(J��)CU����EY�(�򈢮�{��:=���Vx{߭�/��~�      �   ~   x��й1D�xT�XA�CW-[���� ���O��!�p<��u�>;M�Jh����1s0�r��s�qrp����dA;������,�Fg�5:���Y���bnt)���y�׼_Tkoo�� 5�%      �   �  x���Mn�8�וS�Z0I�z��d&� �4�FfӀ@[�-G"=��s�>@����%ڍ� &f�E	���+�í�
��z�.�$���X+;W�֛%ld׽[q����#�|d�&�I<M҈�<�=\��[�lͫ���n˙+��bۋ�[�ҝ��qG����P%�8�Lp|M�O-�<����|�eM���膩U�'`m��D`i���/p#����i1�y�R.�"fA`�J����L`��e�W	2"DZ{�k��;���X,+W$�"d$v]=�p/����<5Cl��l������VR��j�+����R��_(�������3G�G�P.W�ذ��pK����&��pʥ�@�aW1��988Sa��w�ǖbaO��-�.qmM~��ѥ�u
����vhH��2�쀥G���۾J�a14�Z,�<4��N��X�۾H�a����-�c��4{,��+Rd�a�p���YЯhq�&Ք�J�a�q�u[5C'�xy�!�۠���lg4���?�xʒ)ˢ�%��A�h��O��n�M{�9<+��S;K?�w�7����T����+k+��J	x���u�3z;��u��ulO��Z�Q��i޿w�X�q:�q/S����v,<�֡�PW����|{^$�"�y���D-r�B
Ou�[s��Sӊ�LJe��2]��Q�i4�Lw���p%�^�es�g�WʨRv^�q�h�YT)�m�/��ϻnk�c�K�RN���1XѬgQ�.+[K�f5�
w�7��KT�8/%N��-1�[lαh�-1�Ąާ&�\_�"ӓ�
�{��G�+w2h,"��T�,���߇Fk�Af�Ƃ����"=Ш�����Z5.�VՕ���� ���H4�cε;��K+r����Cד"�HT%�-�	��x4D �&u�G���b͔E���O4�^��A�|�|��=��ep��������� ��9�f�"�;et��xו���'MH����	H5x4���q���z��&�$�X�k�x�gNok��Ͳ��Q@�4 �@@t�Et|Qz��9>�������j~Ա��t��u�~|��n��������L6M&Q#'��|Z��n�E�����ݒ'ܛsѳ��߯�U>�����dY&�\���� ^"���\�W���$��ٔ�i£�H�z:�o���ſk	x�     