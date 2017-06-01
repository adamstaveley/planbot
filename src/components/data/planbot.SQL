--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: definitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE definitions (
    key character varying,
    value character varying
);


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE documents (
    key character varying,
    value character varying
);


--
-- Name: local_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE local_plans (
    key character varying,
    value character varying
);


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE projects (
    key character varying,
    value character varying
);


--
-- Name: reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE reports (
    date character varying,
    location character varying,
    sector character varying,
    title character varying,
    url character varying
);


--
-- Name: responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE responses (
    context character varying,
    response character varying,
    quickreplies character varying
);


--
-- Name: use_classes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE use_classes (
    key character varying,
    value character varying
);


--
-- Data for Name: definitions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY definitions (key, value) FROM stdin;
grounds for possession	Grounds for Possession of Dwelling-houses let on Assured Tenancies: Schedule 2 of the Housing Act 1988 contains 17 Grounds upon which the Court must order possession.
trade parks	An out-of-centre mixed-use area of larger retail and light industrial units selling bulky goods.
phasing or phased development	The phasing of development into manageable parts. For example, an annual rate of housing release for a large development that may need to be controlled so as to avoid destabilising housing markets and causing low demand.
qualified investor scheme (qis)	Qualified investor schemes are authorised funds which are intended. only for professional clients and for retail clients who are sophisticated investors
sui generis	A term given to the uses of land or buildings, not falling into any of the use classes identified by the Use Classes Order, for example theatres, launderettes, car showrooms and filling stations.
nimby	"Not In My Back Yard" A person who objects to the siting of something perceived as unpleasant or hazardous in their own neighbourhood, especially one who raises no such objections to similar developments elsewhere.
guarantor	A person who gives a guarantee. For example, where a prospective renter is unable to obtain the required references, the landlord or agent may suggest that the prospective renter's parents guarantee the payment of rent. In this situation the parents are acting as guarantors.
detailed application / full application	A planning application seeking full permission for a development proposal, with no matters reserved for later planning approval.
housing association (ha)	Housing associations in England are independent societies, bodies of trustees or companies established for the purpose of providing low-cost social housing for people in housing need on a non-profit-making basis. Any trading surplus is used to maintain existing homes and to help finance new ones. They are now England’s major providers of new homes for rent, while many also run shared ownership schemes to help people who cannot afford to buy their own homes outright.
planning aid	Planning Aid provides free and independent advice and support to community groups and individuals unable to employ a planning consultant.
marine nature reserves	Sites designated under the Wildlife and Countryside Act to conserve marine flora and fauna or geological or physiographical features.
urban land institute (uli)	ULI is one of the world’s most respected and diverse organisations in the field of development, land use, and urban planning.  Established in 1936, the Urban Land Institute is a not for profit education and research body with nearly 40,000 members across the globe–and nearly 1,000 here in the UK. The ULI has had particular influence over the PRS/Build to Rent market in the UK, organising fact finding missions to the US and Europe and with the publication of 'Build to Rent: A Best Practice Guide'
local centre	A small group of shops and perhaps limited service outlets of a local nature (for example, a suburban housing estate) serving a small catchment. Sometimes also referred to as a local neighbourhood centre.
arms length management organisation (almo)	A company set up by a local authority to manage and improve all or part of its housing stock.
white land	A general expression used to mean land (and buildings) without any specific proposal for allocation in a development plan, where it is intended that for the most part, existing uses shall remain undisturbed and unaltered.
article 4 direction (afd)	Issued by a local authority to remove Permitted Development Rights (PDR) Article 4 directions are made when the character of an area of acknowledged importance would be threatened. They are most common in conservation areas. In cities, they are generally used to prevent the conversion of office space to residential in areas where mercantile activity is important.
plan-led system	The principle that the decisions upon planning applications should be made in accordance with the adopted development plan, unless there are other material considerations that may indicate otherwise.
natural england	Natural England is the Government's statutory adviser on landscape in England, with responsibility for landscape designations such as National Parks, Areas of Outstanding Natural Beauty and Heritage Coasts. Natural England is also concerned with England's future landscapes, with involvement in planning policy and a range of environmental land management projects.
convenience shopping	The provision of everyday essential items, such as food.
net operating income (noi)	Net operating income (NOI) is simply the annual income generated by an income-producing property after taking into account all income collected from operations, and deducting all expenses incurred from operations
planning for real	A consultation method involving creative exercise (for example, the use of maps and model buildings) designed to engage the public in plan making.
local housing company	A local authority-promoted housing development and management organisation, possibly with wider regeneration objectives, likely to be established in partnership ownership between a local authority with other public and/or private sector organisations.
local listing (or building of local importance).	Locally important building valued for contribution to local scene or for local historical situations but not meriting listed building status.
affordable private rent (apr)	Affordable rents were introduced by the Government to allow social housing providers to charge up to 80% of the local market rent for the homes they let. These rents may be higher than those they charged for social rent in the past and the extra income is used to help develop new homes for those in housing need. Also known as Intermediate Rent.
migration	The process by which tenants may move from one asset class/tenure to another. Generally from student accommodation to PRS and onto home ownership.
compulsory purchase order (cpo)	An order issued by the government or a local authority to acquire land or buildings for public interest purposes. For example, for the construction of a major road or the redevelopment of certain brownfield sites.
zone of visual influence (zvi)	The visual 'line of sight' or catchment area having the potential to be visually affected by a particular site or structure, such as wind turbines.
bailiffs	In the context of PRS, generally an Enforcement Officer, County court bailiffs remain directly employed by HM Courts Service, carrying out enforcement for county courts. The current frequency of different types of case means that they are mainly involved in recovering payment of unpaid county court judgments. Like Magistrates' bailiffs, they can seize and sell goods to recover a debt. They can also affect and supervise the possession of the property and the return of goods under hire purchase agreements, and serve court documents.
marine dredged aggregate	Sand and gravel dredged from deposits on the seabed and landed at shipping wharves for use as aggregate.
listed building purchase notice	A notice served on a Local Authority where Listed Building consent is refused or is granted subject to onerous conditions, and where the owner can demonstrate that land is incapable of reasonably beneficial use.
council tax	Council Tax is a local taxation system used in England, Scotland and Wales. It is a tax on domestic property which was introduced in 1993 by the Local Government Finance Act 1992, replacing the Community Charge (popularly known as the Poll Tax). Each property is assigned one of eight bands (A to H) based on property value, and the tax is set as a fixed amount for each band. Some property is exempt from the tax, some people are exempt from the tax, while some get a discount.
landlord	A lessor of real property; the owner or possessor of an estate in land or a rental property, who, in an exchange for rent, leases it to another individual/company known as the tenant. 
economic development	Development, including those within the B Use Classes, public and community uses and main town centre uses (but excluding housing development).
fair wear & tear	The House of Lords defines fair wear and tear as: ‘Reasonable use of the premises by the tenant and the ordinary operation of natural forces
over-development	An amount of development (for example, the quantity of buildings or intensity of use) that is excessive in terms of demands on infrastructure and services, or impact on local amenity and character.
national association of estate agents (now NAEA propertymark) (naea)	NAEA Propertymark protects and guides consumers, helping people to buy and sell their homes. They work to raise professional standards among estate agents from single branch independents to large national groups, promoting education and qualifications within the sector. More than 10,500 estate agent offices are NAEA Propertymark Protected and claim to meet higher standards than the law demands.
construction risk	A construction risk can be defined as any exposure to possible loss. Because every construction project is different, each offers a multitude of varying risks. To ensure the success of a project, a contractor starting on a construction project must be able to recognize and assess those risks.
low demand housing (or areas of housing abandonment)	A location where the housing market has collapsed or is close to doing so resulting in a low demand for housing or actual abandonment. See also Housing Market Renewal.
local authority (la)	Local authorities are registered providers with the Homes and Communities Agency. Stock in this category represents all dwellings owned and built by local housing authorities under the Housing Act 1985. Although dwellings built by New Towns and other government departments (eg Armed Forces such as Ministry of Defence and prison authorities etc.) were historically collected separately, their number are often included in this category 
generation x	Demographic cohort following the baby boomers. There are no precise dates for when this cohort starts or ends; demographers and researchers typically use starting birth years ranging from the early-to-mid 1960s and ending birth years ranging from the late 1970s to early 1980s
composting	The process that converts biodegradable material such as garden or kitchen waste, in the presence of oxygen (aerobic) into a stable material that can be used as a soil improver. Composting can be done at different scales, from home composting to a large centralised facility.
transport assessment	A simplified version of a transport assessment where it is agreed the transport issues arising out of development proposals are limited and a full transport assessment is not required.
outline application	A general application for planning permission to establish that a development is acceptable in principle, subject to subsequent approval of detailed matters. Does not apply to changes of use.
lease	A contract renting land, buildings etc., to another; a contract or instrument conveying property to another for a specified period or for a period determinable at the will of either the lessor or lessee in consideration of rent or other compensation. 
claw-back	The claw back principle can be applied to enable a selling owner to enjoy future uplifts in value provided the appropriate legal machinery is incorporated into the documents at the time of the sale so that it binds the purchaser. Particularly popular when assest are sold by the public sector or charities to avoid future embarassment if the asset is subsequently sold on for profit.
historic battlefield	Areas of historic interest where important battles are sufficiently documented to be located on the ground. Designated by English Heritage.
urban sprawl	The uncontrolled or unplanned extension of urban areas into the countryside.
use	The way in which land or buildings are used.
defects liability period (dlp)	A period following practical completion (usually six or 12 months) during which a building contractor retains liability under a building contract for dealing with any defects which manifest themselves. Also known as a rectification period.
planning inspectorate	The Planning Inspectorate's work includes national infrastructure planning under the Planning Act 2008 process (as amended by the Localism Act 2011), processing planning and enforcement appeals and holding examinations into local plans and community infrastructure levy charging schedules.
vacant possession value (vpv)	The market value of a property on the assumption that the property is: unlet, vacant and available for occupancy. VPV is therefore a market value and all guidelines, methods, rules and techniques that govern the estimation of the market value equally apply to VPV. 
restoration (in terms of minerals operations)	Steps to return land to its original or former condition following mineral working by using subsoil, topsoil or soil-making material.
association of residential managing agents (arma)	ARMA represents firms of residential managing agents (Block managers) . They do not represent individual property managers. ARMA’s members range from small family run businesses looking after a few blocks, to national companies managing tens of thousands of flats across numerous developments. The types of buildings ARMA members manage can vary enormously in size and style; some are new build tower blocks, some are converted houses and others are purpose built mansion blocks dating back to the Twenties and Thirties.
out-of-centre	A location which is not in or on the edge of a centre but not necessarily outside the urban area.
mineral safeguarding area	An area designated by Minerals Planning Authorities which covers known deposits of minerals which are desired to be kept safeguarded from unnecessary sterilisation by non-mineral development.
kerbside collection	The collection by local authorities of recyclable goods directly from households, or occasionally industrial and commercial premises.
mast-sharing (including mobile phone masts)	More than one antenna sharing a mast or a site, perhaps helping to reduce visual impact.
main town centre uses	Retail development (including warehouse clubs and factory outlet centres); leisure, entertainment facilities the more intensive sport and recreation uses (including cinemas, restaurants, drive-through restaurants, bars and pubs, night-clubs, casinos, health and fitness centres, indoor bowling centres, and bingo halls); offices; and arts, culture and tourism development (including theatres, museums, galleries and concert halls, hotels and conference facilities).
dilapidations	The term 'dilapidations' refers to breaches of lease covenants that relate to the condition of the property, and the process of remedying those breaches.
assured shorthold tenancy (ast)	Entitles the landlord to a possession order immediately after the initial agreed period, (usually six months). The landlord is then able to evict the tenant without a legal reason. The following conditions apply: A: you’re a private landlord or housing association. B: tenancy started on or after 15/01/1989. C: the property is your tenants’ main accommodation. D: the landlord doesn’t live in the property. A tenancy can’t be an AST if: 1: the rent is more than £100,000 p.a. or less than £250 p.a. (£1,000 in London). 4: it’s a business tenancy or tenancy of licensed premises. 5: it’s a holiday let. 6: the landlord is a local council.
household waste recovery centres / civic amenity sites	A facility provided by the Waste Disposal Authority that is available to the public to deposit waste which cannot be collected by the normal household waste collection round.
build-to-rent	Industry term for purpose-built private rented stock broadly analogous to the US multifamily sector, on which the model is based. As such, it is also occasionally referred to as UK multi-family. While this has become for many the default term to describe this new sector, it narrowly refers to the physical creation of this new asset class, ignoring the crucial long-term management and performance of the buildings. attrib JLL
nature conservation	An Order made by a local planning authority (under the Town and Country Planning Act 1990) through which Parish Councils and neighbourhood forums can grant planning permission for a specific development proposal or classes of development.
best and most versatile agricultural land	Land in grades 1, 2 and 3a of the Agricultural Land Classification.
light rail	A local railway or tram system, sometimes capable of sharing roads with traffic and heavy railways.
climate change	Long-term changes in temperature, precipitation, wind and all other aspects of the Earth's climate. Often regarded as a result of human activity and fossil fuel consumption.
homeland generation	See Generation Z
use classes order	The Town and Country Planning (Use Classes) Order 1987 puts uses of land and buildings into various categories. Planning permission is not needed for changes of use within the same use class.
area action plan	A type of Development Plan Document focused upon a specific location or an area subject to conservation or significant change (for example major regeneration).
community land trusts (clts)	Independent non-profit trusts which own or control land and facilities in perpetuity for the benefit of the community.
tenancy agreement	The contractual, lease relationship between a lessor of residential premises (landlord) and his lessee (tenant); a tenancy of residential premises. A written or oral contract, oral, express or implied, between a landlord and tenant in regards to the latter's occupation of residential premises.
informal hearing	A planning appeal hearing undertaken in a structured way, but without the full formality of a local inquiry.
urban design	The art of making places. It involves the design of buildings, groups of buildings, spaces and landscapes, in villages, towns and cities, to create successful development.
civic amenity site	A facility provided by the Waste Disposal Authority that is available to the public to deposit waste which cannot be collected by the normal household waste collection round.
blight	In general terms, blight is the depressing effect on an area or property caused by potential development proposals, for example a proposed major new road.
inset village / village envelope	A village that is 'inset' from the Green Belt or other countryside protection policies on the proposals map, sometimes allowing appropriate development.
capital gain	Capital gain is an increase in the value of a capital asset (investment or real estate) that gives it a higher worth than the purchase price. The gain is not realized until the asset is sold. A capital gain may be short-term (one year or less) or long-term (more than one year) and must be claimed on income taxes.
direct debit (dd)	A Direct Debit is an instruction by an individual to a bank or building society. It authorises the organisation the payer wishes to pay to collect varying amounts from their account – but only if the payer has been given advanced notice of the amounts and dates of collection. Once agreed, the money is deducted automatically. If the organisation the payer is paying wants to change an amount or date of collection, they have to be informed first.
(hre) historic environment record	Information services that seek to provide access to comprehensive and dynamic resources relating to the historic environment of a defined geographic area for public benefit and use.
permanent modular construction (pmc)	Permanent Modular Construction is a delivery method utilizing offsite, lean manufacturing techniques to prefabricate single or multi-story buildings. PMC modules can be integrated into site built projects or stand alone as a turn-key solution and can be delivered with MEP, fixtures and interior finishes. The buildings are 60% to 90% completed offsite in a factory-controlled environment, and transported and assembled at the final building site. In many cases, modular contractors work with traditional general contractors to leverage the resources and advantages of each type of construction.
development	Development is defined under the 1990 Town and Country Planning Act as "the carrying out of building, engineering, mining or other operation in, on, over or under land, or the making of any material change in the use of any building or other land." Most forms of development require planning permission (see also "permitted development").
sustainable transport modes	Any efficient, safe and accessible means of transport with overall low impact on the environment, including walking and cycling, low and ultra low emission vehicles, car sharing and public transport.
mineral	Rock or other material that has a commercial value when extracted.
plurals	See Generation Z
warehouse clubs	Out-of-centre businesses specialising in volume sales of reduced priced goods often in large buildings with large car parks.
commercial waste	Controlled waste arising from trade premises.
house share	See: 'HMO'
rent	A tenant's regular payment, generally monthly, to a landlord for the use of property or land.
highways agency	An executive agency of the Department for Transport. The Highways Agency is responsible for operating, maintaining and improving the strategic road network of England.
established need	A need for a mineral when assessed against existing permitted reserves of suitable material, taking into account any apportionment and other appropriate policy guidance.
facilities management (fm)	Facility management (or facilities management or FM) is a professional management discipline focused upon the efficient and effective delivery of support services for the organisations that it serves. It encompasses multiple disciplines to ensure functionality of the built environment by integrating people, systems, place, process, and technology.
industrial waste	Waste from a factory or industrial process.
statement of community involvement (sci)	The Statement of Community Involvement sets out the processes to be used by the local authority in involving the community in the preparation, alteration and continuing review of all local development documents and development control decisions. The Statement of Community Involvement is an essential part of the new-look Local Development Frameworks.
voids	The period of time where a property is empty and not producing income. Often referred to as "void period" 
conservation area character appraisal	A published document defining the special architectural or historic interest that warranted the area being designated.
countryside agency	The organisation responsible for advising government and taking action on issues affecting the social, economic and environmental well being of the English countryside.
advisory team for large applications (atlas)	Body funded by Government to help unblock the issues holding up decisions on large planning applications, increase the knowledge and expertise of local authorities in handling such projects, share good practice across the sector and act as a partner to local authorities and independent reviewer of large applications and issues. View their guidance at:
site visit	A visit to a proposed development site conducted by planning officers, councillors or inspectors to clarify the appearance of a site or visualise the effects of the proposal.
private rented sector (p.r.s.)	This is the tenure of market-rented properties in the UK, sitting alongside social rented and owner occupation as the three main rental tenures. It is often misused as a comparable term for the modern Build to Rent sub-set. It is also referred to as ‘market rent’.
conurbation	A large densely populated urban sprawl formed by the growth and coalescence of individual towns or cities.
internal rate of return (irr)	The IRR is defined as the discount rate at which the net present value of a set of cash flows (i.e., the initial investment, expressed negatively, and the returns, expressed positively) equals zero. In more simple terms, it is the rate at which a real estate investment grows (or, heaven forbid, shrinks). In this sense, you can think of it as a time sensitive compounded annual rate of return. An average IRR for Real Estate funds would be in the region of 15-16%
leasehold advisory service (las)	LEASE was set up in 1994 to provide free information, initial advice and guidance to members of the public about residential leasehold and park homes law. They have been providing this service for more than 20 years. As the first point of contact for leaseholders, they are independent and impartial and all of their advisers are legally qualified.
claw-back (a retailing term)	The ability of a new retail store to retain trade or customers that may otherwise travel further afield.
investment structure	A financial & legal construct designed to allow investors to create, for example, partnerships or other holding structures /vehicles with which to invest in any asset for the purpose of increasing the value of the investment.
regeneration	The economic, social and environmental renewal and improvement of rural and urban areas.
layout	The way buildings, routes and open spaces are placed or laid out on the ground in relation to each other.
arla property mark (arla)	See: Association of Residential Letting Agents
high demand housing areas	Locations with a high demand for housing resulting in expensive pricing and rents making it difficult to enter the housing market. For example, some rural locations, commuter areas, and many locations in southern England.
third party management (tpm)	A  company contracted by the Investor or operator to manage the letting and day to day business of a specific building(s). The TPM may also be the branded entity which, to all intents and purposes, appears to act like an operator but without assuming the financial risk/responsibility.
inventory	An itemised list of all the furniture, fixtures and fittings contained in a property.
coalescence	The merging or coming together of separate towns or villages to form a single entity.
cost-benefit analysis	An assessment method that is sometimes used to compare the benefits and costs of a development proposal, such as a major infrastructure project.
inclusive design	Designing the built environment, including buildings and their surrounding spaces, to ensure that they can be accessed and used by everyone.
heavy rail	The traditional railway network, using standard rolling stock.
article 14 direction	A direction which withdraws automatic planning permission granted by the General Permitted Development Order. An Article 14 Direction means that a local planning authority cannot grant planning permission for a particular proposal until further notice.
(aqms) air quality management strategy	A designation made by a local authority where an assessment of air quality results in the need to devise an action plan to improve the quality of air.
multi-dwelling unit (mdu)	See 'Tower' and 'Multi-Family"
gross initial yield (giy)	The gross initial yield is the yield on an investment at acquisition before the deduction of taxes and expenses. Gross yield is expressed in percentage terms. It is calculated as the annual return on an investment prior to taxes and expenses divided by the current price of the investment.
nature improvement area	The protection, management and promotion of wildlife habitat for the benefit of wild species, as well as the communities that use and enjoy them.
apartment	An apartment or a flat is a self-contained housing unit (a type of residential real estate) that occupies only part of a building, correctly, on a single level without a stair. Such a building may be called an apartment building, apartment complex, flat complex, block of flats, tower block, high-rise or, occasionally mansion block, especially if it consists of many apartments for rent. In Scotland it is called a block of flats or, if it's a traditional sandstone building, a tenement, which has a pejorative connotation elsewhere. Apartments may be owned by an owner/occupier, by leasehold tenure or rented by tenants 
development plan	A document setting out the local planning authority's policies and proposals for the development and use of land and buildings in the authority's area. This includes adopted Local Plans, neighbourhood plans and the London Plan, and is defined in section 38 of the Planning and Compulsory Purchase Act 2004. (Regional strategies remain part of the development plan until they are abolished by Order using powers taken in the Localism Act. It is the Government’s clear policy intention to revoke the regional strategies outside of London, subject to the outcome of the environmental assessments that are currently being undertaken.)
standing order (so)	A standing order (or a standing instruction) is an instruction a bank account holder ("the payer") gives to his or her bank to pay a set amount at regular intervals to another's ("the payee's") account. The instruction is sometimes known as a banker's order.
tenant	A person who occupies land or property rented from a landlord.
inquiry (sometimes known as a public local inquiry)	A hearing by an planning inspector into a planning matter such as a local plan or appeal.
modular building systems (mbs)	See: Permanent Modular Construction' (PMC)
e-government / e-planning	Government initiatives helping local authorities provide planning services online and accessible via the internet and email, for example, the Planning Portal website.
demand responsive transport	A local transport service tailored to passenger needs, operating not unlike a taxi service. Usually provided where there are infrequent bus services, such as rural areas.
fair rent	If a tenancy started before 15 January 1989, this is likely to be a regulated or secure tenancy. A landlord or a tenant of a regulated or secure tenancy can make an application to have a fair rent registered. A fair rent may be lower than the market rent. Fair rents are registered by Valuation Office Agency (VOA) rent officers. Tenants may apply for registrations of rent every two years, or sooner if there are major changes to a property eg repairs, improvements or rebuilding works. Landlords can apply for registrations of rent after 21 months.
town centre mall	A purpose-built shopping centres incorporating many individual shop units usually concentrating on comparison goods and sometimes leisure, residential and other uses.
covenant agreement	An agreement between the Local Planning Authority (LPA) and the developer whereby the developer agrees to maintain the agreed status of the consented scheme usually for a fixed period of time. May generally be used in a PRS context to ensure a scheme is to remain 'for rent' only for 10-15 years. Should the developer or eventual owner wish to vary or discharge the covenant before 'term' the original agreement will often contain a formula for compensation in favour of the LPA
homes & communities agency (hca)	The Homes and Communities Agency (HCA) is the non-departmental public body that funds new affordable housing in England. It was established by the Housing and Regeneration Act 2008 as one of the successor bodies to the Housing Corporation, and became operational on 1 December 2008.
geothermal technology	Technology related to the transfer of energy from heat inside the Earth, usually carried to the surface by superheated water and steam.
archaeological interest	There will be archaeological interest in a heritage asset if it holds, or potentially may hold, evidence of past human activity worthy of expert investigation at some point. Heritage assets with archaeological interest are the primary source of evidence about the substance and evolution of places, and of the people and cultures that made them.
coastal change management area	An area identified in Local Plans as likely to be affected by coastal change (physical change to the shoreline through erosion, coastal landslip, permanent inundation or coastal accretion).
farmer review: modernise or die	Whilst not specifically PRS or BTR, In February 2016, Cast CEO, Mark Farmer, was commissioned by the Construction Leadership Council, at the request of Brandon Lewis and Nick Boles (the ministers for Housing & Planning & Skills respectively at that time) to undertake a review of the UK’s construction labour model. The review was asked to focus on areas as follows:- 
yuppie	"Young Upwardly Mobile Professionals"
referee	A person who supplies a reference.
brand/branding	Branding is a set of marketing and communication methods that help to distinguish a company from competitors and create a lasting impression in the minds of customers. The key components that form a brand's toolbox include a brand’s identity, brand communication (such as by logos and trademarks), brand awareness, brand loyalty, and various branding (brand management) strategies. Brand equity is the measurable totality of a brand's worth and is validated by assessing the effectiveness of these branding components
limited liability partnership (llp)	A limited liability partnership (LLP) is a partnership in which some or all partners (depending on the jurisdiction) have limited liabilities. It therefore exhibits elements of partnerships and corporations. In an LLP, one partner is not responsible or liable for another partner's misconduct or negligence.
consumer price index (cpi)	A consumer price index (CPI) measures changes in the price level of market basket of consumer goods and services purchased by households. The CPI is a statistical estimate constructed using the prices of a sample of representative items whose prices are collected periodically.
landfill directive	European Union requirements on landfill to ensure high standards for disposal and to stimulate waste minimisation.
sites and monuments record	List, description, and assessment of all known ancient monuments and sites of archaeological interest in an area including a map of each site.
superstore	A self-service store selling mainly food, or food and non-food goods, usually of more than 2,500 square metres of trading floor space, with a large car park.
building information modelling (bim)	A digital representation of physical and functional characteristics of a facility. A BIM is a shared knowledge resource for information about a facility forming a reliable basis for decisions during its life-cycle; defined as existing from earliest conception to demolition
carbon challenge (eco-villages)	A Government programme to accelerate the house-building industry's response to climate change by fast-tracking the creation of a number of zero and near zero carbon communities. The key objective is to raise the environmental performance of new communities while still delivering quality and high standards of design.
shopmobility	Enabling of independent access to retail facilities through the provision of wheelchairs, scooters and escorts for people with physical or visual impairments.
pods	An off-site prefabricated cell, such as a fully fitted kitchen or bathroom, which is delivered to a construction site and can just be slotted in. 
chief planning officer	The lead planning officer at a local authority. Some authorities use the title Head of Planning.
close ended fund (cef)	An investment fund that has a fixed amount of share capital and cannot issue or redeem units according to shifts in demand. Normally listed on the stock exchange. Called an investment trust in the UK. The opposite of an open-end fund (or unit trust in the UK). The investment company operating a closed-end fund is called a closed-end management company. Also referred to as a closed-end mutual fund, closed-end funds are a type of actively managed investment fund containing multiple securities. Closed-end funds raise capital through initial public offerings (IPOs) and then are traded on exchanges like stocks
landbank	The stock land with planning permissions but where development has yet to take place. The landbank can be of land for minerals, housing or any other use.
special area of conservation (sac)	Areas given special protection under the European Union’s Habitats Directive, which is transposed into UK law by the Habitats and Conservation of Species Regulations 2010.
broadband	Fast, always-on internet connection.
environment agency	A government body that aims to prevent or minimise the effects of pollution on the environment and issues permits to monitor and control activities that handle or produce waste. It also provides up-to-date information on waste management matters and deals with other matters such as water issues including flood protection advice.
retail impact	The potential effects of proposed retail development upon existing shops.
core strategy	A Development Plan Document setting out the spatial vision and strategic objectives of the planning framework for an area, having regard to the Community Strategy (see also DPDs).
historic environment	All aspects of the environment resulting from the interaction between people and places through time, including all surviving physical remains of past human activity, whether visible, buried or submerged, and landscaped and planted or managed flora.
environmental impact assessment (eia)	A procedure to be followed for certain types of project to ensure that decisions are made in full knowledge of any likely significant effects on the environment.
joint tenancy	Joint tenants take the tenancy of the property as a group at a single rent for the whole property. The principle behind the joint tenancy is that, although the rights granted by the landlord are granted to a group of people, this group is treated by the law in many respects as if it was a single person. Under a joint tenancy, if one occupier breaches the terms of the agreement, or each occupier denies individual responsibility for damage to the property, the landlord can either claim against all of them jointly or against each one individually.
regional self sufficiency	Requires that most waste should be managed within the region in which it is produced.
waste disposal authority (wda)	A local authority responsible for managing the waste collected by the collection authorities and the provision of household waste recovery centres.
spot-listing	The process by which buildings are listed on an individual basis (often in response to a third-party request), rather than as part of a formal review of buildings in a particular area.
convenience goods	Everyday essential items, such as food.
energy from waste	The conversion of waste into a useable form of energy, often heat or electricity.
ultra high net worth (uhnw)	Ultra high-net-worth individuals (UHNWI) are defined as having a net worth of at least US$30 million in constant 2012 dollars (after accounting for shares in public and private companies, residential and passion investments such as art, planes and real estate)
infill development	The development of a relatively small gap between existing buildings.
mortgagor	The borrower in a mortgage, typically a homeowner.
circular	A government publication setting out procedural matters and guidance.
biodegradable waste	Waste that is capable of breaking down naturally, such as food, garden waste and paper.
local enterprise partnership	A body, designated by the Secretary of State for Communities and Local Government, established for the purpose of creating or improving the conditions for economic growth in an area.
mydeposits	One of three Government authorised firms protecting deposits for tenants
licence	A licence is normally created where a person is granted the right to use premises without becoming entitled to an exclusive possession of them. In practice, most commonly licences operate as to allow for the property to be used for a specific purpose and for a defined period of time
district centres	A group of shops and some service outlets serving part of an urban area and providing a geographic focus for it, separate from the town centre but with more variety than local centres.
local need housing	Housing requirements generated by the indigenous population rather than by in-migration.
apportionment (amount of minerals needed)	The splitting of regional supply guidelines for minerals demand between planning authorities or sub regions.
design statement	A design statement can be made at a pre-planning application stage by a developer, indicating the design principles upon which a proposal is to be based. It may also be submitted in support of a planning application.
natural surveillance (or supervision)	The discouragement to wrongdoing by the presence of passers-by or the ability of people to be seen out of surrounding windows. Also known as passive surveillance (or supervision). See also Planning Out Crime.
institute of residential property management (irpm)	The IRPM was launched in 2002 as a means of delivering a portable professional qualification in residential property management, available to anyone working in the sector and accepted by all those operating within it. The Association of Residential Managing Agents (ARMA,) Association of Retirement Housing Managers (ARHM) and the Property Managers Association Scotland (PMAS) were founding sponsors
timber frame	Timber frame is a modern method of construction – using standardised, prefabricated timber wall panels and floors – which bears no relation to its Tudor ‘post and beam’ namesake. Nor does it bear much relation to the form of softwood framing common in the 19th and first half of the 20th centuries. This modern method of constructing housing and other buildings uses advanced breathable membranes, insulation and vapour control layers along with careful detailing to ensure durability. Building regulation requirements for thermal, acoustic and fire performance are all incorporated into the timber frame design.
return on capital employed (roce)	Sometimes referred to as ROC, Return on capital employed (ROCE) is a financial ratio that measures a company's profitability and the efficiency with which its capital is employed. ROCE is calculated as: ROCE = Earnings Before Interest and Tax (EBIT) / Capital Employed.
archaeological reserve	A non-statutory designation for protecting archaeological remains.
purpose built (pb)	A purpose built flat is a flat that was originally constructed to be a flat. In this way it is totally different from a converted flat. Purpose built flats are usually grouped in large blocks. The various flats in a block will usually be identical or similar in design.
energy performance certificates (epcs)	Energy Performance Certificates give home buyers and sellers A to G ratings for their home's energy efficiency and carbon emissions.
employment land availability (ela)	The total amount of land reserved for industrial and business use awaiting development.
development plan documents (dpd)	 DPDs outline the key development goals of the local development framework. Development Plan Documents include the core strategy and, where needed, area action plans. There will also be an adopted proposals map which illustrates the spatial extent of policies. All DPDs must be subject to rigorous procedures of community involvement, consultation and independent examination, and adopted after receipt of the inspector's binding report. Once adopted, development control decisions must be made in accordance with them unless material considerations indicate otherwise. DPDs form an essential part of the Local Development Framework.
national apartment association (us)	The National Apartment Association (NAA) is a non-profit trade association of apartment communities, owners and suppliers. These member companies are also part of NAA with their membership at the local level. Members represent the various facets of the multifamily housing industry: apartment owners, management executives, developers, builders, investors, property managers, leasing consultants, maintenance personnel, suppliers and related business professionals throughout the United States and Canada. NAA has its headquarters in Arlington, VA. The UKAA is the United Kingdom's equivalent.
ancillary use / operations	A subsidiary or secondary use or operation closely associated with the main use of a building or piece of land.
multi-family	Multifamily residential (also known as multidwelling unit or MDU) is a U.S. classification of housing where multiple separate housing units for residential inhabitants are contained within one building or several buildings within one complex. A common form is an apartment building. Generally, these would be rental only buildings with a strong focus on creating a sense of community amongst the residents who benefit from the diverse community amenity intrinsic to the building(s).
countryside character areas	Areas of distinctive landscape, wildlife and natural features as defined by the Countryside Agency.
english heritage	Government advisors with responsibility for all aspects of protecting and promoting the historic environment. See also Historic England
muppie	"Middle Aged Urban(e) Professional" 
community infrastructure levy (cil)	The Community Infrastructure Levy is a planning charge, introduced by the Planning Act 2008 as a tool for local authorities in England and Wales to help deliver infrastructure to support the development of their area. It came into force on 6 April 2010 through the Community Infrastructure Levy Regulations 2010
aged or veteran tree	A tree which, because of its great age, size or condition is of exceptional value for wildlife, in the landscape, or culturally.
united kingdom apartment association (ukaa)	UKAA is the leading membership body for all involved in the residential rental sector in the UK. They were developed  as an organisation by Roger Southam in response to the increasing demand of the growing Build-to-Rent sector. They are a Global Alliance Partner of the NAA (National Apartment Association) in the US. NAA have been in existence for over 70 years and represent over 8.5 million rented units.
landfill (including land raising)	The permanent disposal of waste into the ground, by the filling of man-made voids or similar features, or the construction of landforms above ground level (land-raising).
regulated tenancy	Tenancies starting before 15 January 1989 may be regulated. There is  increased protection from eviction and tenants can apply for a ‘fair rent’.
unauthorised development	Development that has or is taking place without the benefit of planning permission. It may then risk being the subject of enforcement action.
house price index (hpi)	The UK House Price Index (HPI) uses house sales data from Land Registry, Registers of Scotland, and Land and Property Services Northern Ireland and is calculated by the Office of National Statistics. The index applies a statistical method, called a hedonic regression model, to the various sources of data on property price and attributes to produce estimates of the change in house prices each period. The index is published monthly, with Northern Ireland figures updated quarterly.
world heritage site	A cultural or natural site of outstanding universal value designated by the International Council on Monuments and Sites (ICOMOS), for example Durham Cathedral and Stonehenge.
permitted development rights (pdr)	Permitted development rights are a national grant of planning permission which allow certain building works and changes of use to be carried out without having to make a planning application. Permitted development rights are subject to conditions and limitations to control impact and to protect local amenity. This right was temporarily  extended to allow coversion of offices to residential in 2003 and was to expire in 2016. It was subsequently extended indefinitely.  Exemptions (Article 4 Directions) are currently in force across 17 local authorites and in London, Manchester and Ashford. 
travel generators	Areas of land use (or developments) that generate travel demands including places of work, schools and colleges, shops and retail parks, hospitals and leisure facilities.
biomass	Living matter within an environmental area, for example plant material, vegetation, or agricultural waste used as a fuel or energy source.
waste minimisation / reduction	The most desirable way of managing waste, by avoiding the production of waste in the first place.
urban extension	Involves the planned expansion of a city or town and can contribute to creating more sustainable patterns of development when located in the right place, with well-planned infrastructure including access to a range of facilities, and when developed at appropriate densities.
arrears	Arrears is a legal term for the part of a debt that is overdue after missing one or more required payments. The amount of the arrears is the amount accrued from the date on which the first missed payment was due. The term is usually used in relation with periodically recurring payments such as rent. 
manager	In fund terms, a property investment expert who will manage the fund/holding structure which invests in the PRS assets. This person will be FCA accredited.
pollution prevention and control / integrated pollution control	A system of regulations and permit regime designed to prevent or reduce pollution.
community infrastructure levy	A levy allowing local authorities to raise funds from owners or developers of land undertaking new building projects in their area.
propertymark	Propertymark’s membership organisations – the Association of Residential Letting Agents (ARLA), the National Association of Estate Agents (NAEA), the National Association of Valuers and Auctioneers (NAVA), the Association of Professional Inventory Providers (APIP) and the Institution of Commercial and Business Agents (ICBA).
town centre management	A forum of traders, businesses and local authorities to agree and undertake co-ordinated management and care the retail area, promote trade and funding improvements.
urban fringe	The urban fringe is the transitional area between urban areas and the countryside. It can provide a valuable resource for the provision of sport and recreation, particularly in situations where there is an absence of land within urban areas to meet provision.
assignment	An assignment (Latin cessio) is a term used with similar meanings in the law of contracts and in the law of real estate. In both instances, it encompasses the transfer of rights held by one party—the assignor—to another party—the assignee
(spd) supplementary planning documents	Documents which add further detail to the policies in the Local Plan. They can be used to provide further guidance for development on specific sites, or on particular issues, such as design. Supplementary planning documents are capable of being a material consideration in planning decisions but are not part of the development plan.
net development value (ndv)	Net Development Value. Net Development Value is the estimated end value of a development project as determined by the external valuers for when the building is completed and fully let (taking into account tenant incentives and notional purchaser's costs).
public art	Permanent or temporary physical works of art visible to the general public, whether part of a building or free-standing. For example, sculpture, lighting effects, street furniture, paving, railings and signs.
capital value	The total worth of one or more investment properties. 
index of multiple deprivation (imd)	A ward-level index made up from six indicators (income; employment; health deprivation and disability; education; skills and training; housing; and geographical access to services). IMD can help to identify areas for regeneration.
heritage asset	A building, monument, site, place, area or landscape identified as having a degree of significance meriting consideration in planning decisions, because of its heritage interest. Heritage asset includes designated heritage assets and assets identified by the local planning authority (including local listing).
noise exposure category (nec)	In terms of planning guidance, when assessing a proposal for residential development near to a source of noise, planning authorities use noise exposure categories to help consider the effects.
competent person (to prepare site investigation information)	A person with a recognised relevant qualification, sufficient experience in dealing with the type(s) of pollution or land instability, and membership of a relevant professional organisation.
national land use database (nlud)	Government initiative to provide information on the amount of previously developed land (and buildings) that may be available for development.
windfall site	Sites which have not been specifically identified as available in the Local Plan process. They normally comprise previously-developed sites that have unexpectedly become available.
community	In PRS terms, a social group of any size, culture and age, whose members reside in the same locality, and who share facilities and amenities offered by a PRS or BTR operator. The operator will foster a sense of community to improve tenants quality of life and to ensure the investors returns are stable and consistent.
ecological network	These link sites of biodiversity importance.
flood risk assessment	An assessment of the likelihood of flooding in a particular area so that development needs and mitigation measures can be carefully considered.
rural development area	A rural area suffering a concentration of economic and social needs where regeneration initiatives are focused.
liquidity	Liquidity determines whether assets will be sold quickly or slowly and if the price will be above or below market value. Property that is easy to sell and purchased at market value is liquid. Conversely, assets that are harder to sell and transact for a discounted price are considered illiquid
freehold (fh)	 A life estate, an interest in land the duration of which is restricted to the life or lives of a particular person or persons holding it, or an estate in fee, an interest in property that is unconditional and represents the broadest ownership interest recognized by law. In order to be categorized as a freehold, an estate must possess the characteristics of (1) immobility- in the sense that the property must be either land, or some interest derived from or affixed to land—and (2) indeterminate duration.
prudential regulation authority (pra)	The PRA is a part of the Bank of England and responsible for the prudential regulation and supervision of banks, building societies, credit unions, insurers and major investment firms. It sets standards and supervises financial institutions at the level of the individual firm.
incineration	The controlled burning of waste. Energy may also be recovered in the form of heat (see Energy from Waste).
front of house	The part of the apartment building or complex where the customer first engages. Not dissimilar to hotels, thought has gone into creating a positive first impression through, arrival and departure experience and layout design to generate a reassuring atmosphere and sense of being home. It is where the employees deal directly with customers: The front of house service is ultra-efficient and observant, yet human and personable
sub-let	By renting a property from a landlord and then during the tenancy the original tenant moves out and rents the property out to someone else, it has been sublet. In most tenancy agreements subletting is prohibited.
sustainable development	Sustainable development is development that meets the needs of the present, without compromising the ability of future generations to meet their own needs.
option agreement	An agreement between two parties that provides one of the parties with the right but not the obligation to buy, sell or obtain a specific asset at an agreed upon price at some time in the future. 
setting of a heritage asset	The surroundings in which a heritage asset is experienced. Its extent is not fixed and may change as the asset and its surroundings evolve. Elements of a setting may make a positive or negative contribution to the significance of an asset, may affect the ability to appreciate that significance or may be neutral.
materials recycling facility (mrf)	A facility for sorting and packing recyclable waste.
adopted proposals map	A component of a Local Development Framework and an important part of the development plan, or DPD itself, showing the location of proposals in all current Development Plan Documents, on an Ordnance Survey base map.
non-statutory nature reserve	Sites established and managed by a variety of public and private bodies e.g. Country Wildlife Trusts or the Royal Society Protection of Birds.
local development scheme (lds)	The local planning authority's scheduled plan for the preparation of Local Development Documents.
information technology (it)	The technology required for information processing. In particular, the use of computers and computer software to convert, store, process, transmit and retrieve information.
local nature reserve	Non-statutory habitats of local significance designated by local authorities where protection and public understanding of nature conservation is encouraged. (See also Site of Nature Conservation Importance or Site of Biological Interest).
section 106 agreement (s106)	A section 106 agreement is an agreement between a developer and a local planning authority about measures that the developer must take to reduce their impact on the community. A section 106 agreement is designed to make a development possible that would otherwise not be possible, by obtaining concessions and contributions from the developer. It forms a section of the Town And Country Planning Act 1990.
independent examination	The process by which a planning inspector may publicly examine a Development Plan Document (DPD) or a Statement of Community Involvement (SCI), in respect, before issuing a binding report. The findings set out in the report of binding upon the local authority that produced the DPD or SCI.
flat	See 'Apartment'
international, national and locally designated sites of importance for biodiversity	All international sites (Special Areas of Conservation, Special Protection Areas, and Ramsar sites), national sites (Sites of Special Scientific Interest) and locally designated sites including Local Wildlife Sites.
waste	Waste is any material or object that is no longer wanted and requires disposal. If a material or object is re-usable, it is still classed as waste if it has first been discarded.
spatial planning	Spatial planning goes beyond traditional land use planning to bring together and integrate policies for the development and use of land with other policies and programmes which influence the nature of places and how they function. This will include policies which can impact on land use by influencing the demands on, or needs for, development, but which are not capable of being delivered solely or mainly through the granting or refusal of planning permission and which may be implemented by other means.
amenity	Broadly speaking, multifunctional spaces, generally starting at the ground floor with a lobby, lounge, Wi-Fi, curator, and café, (possibly open to the public) and extend to roof level where dedicated communal floors include a cinema, lounges and dining areas, exercise space, roof top allotments, play space, and barbeques. These spaces offer residents an attractive and stimulating environment helping to foster strong communities
wildlife corridor	Areas of habitat connecting wildlife populations.
legibility (in terms of settlement patterns)	A legible area is one with a strong sense of local identity. Locations, streets, open spaces and places that have a clear image and are easy to understand. For example, a location that is easy to find your way around.
high court challenge	The process by which an applicant may challenge a planning decision or a notice of intention to adopt a development plan in the High Court on a point of law. However, other appeal procedures may apply first and prior legal advice is advisable.
open space	All open space of public value, including not just land, but also areas of water (such as rivers, canals, lakes and reservoirs) which offer important opportunities for sport and recreation and can act as a visual amenity.
section 96a (s96a)	Section 96A of the Town and Country Planning Act 1990, amended by the Planning Act 2008, permits applications for non-material amendment to planning permissions. This avoids the need for a new planning application to be submitted, allowing instead for the existing permission to be amended whilst remaining subject to the original conditions and time limits.
capacity (in retailing terms)	Potential spending by the public within the catchment area, with which to support existing and additional retail floorspace.
t-house design flexibility	A term to describe T-shaped envelopes which can adapt to location specific demands and needs and can provide four 1-bed flats + one 2-bed house; six 1-bed maisonettes; two 3-bed houses and one 2-bed house; or one multi-generational house. 
regional and sub-regional shopping centres	Out-of-town or out-of-centre shopping centres generally over 50,000 square metres net retail area, typically enclosing a wide range of comparison goods.
right to buy	A scheme under which most council tenants and some housing association tenants may buy their homes at a lower price than the full market value. Only properties that are particularly suitable for occupation by elderly or disabled people, or are let in connection with the tenant's employment, are exempt. People qualify for a discount on the basis of the number of years that they have been social rented housing tenants, subject to a Government-specified maximum amount that varies region by region.
post-millenials	See Generation Z
net sales area (nsa)	Net Saleable Area (NSA) Usually used for residential property and is very similar to Gross Internal Area (GIA). It includes all floor area including internal walls, mezzanines, hallways, bathrooms but excludes common spaces, patios, balconies.
prs 'champion'	The Government PRS Champion, as at 17/03/2017, is  Mark Davis of the DCLG. This post was created in the wake of the PRS Taskforce which was disbanded in March 2015.
aquifers	The special underground rock layers that hold groundwater, which are often an important source of water for public water supply, agriculture and industry.
management company	A company contracted by the Investor or operator to manage the letting and day to day business of a specific building(s). (See also Third Party Management TPM)
opencast working	A form of surface mining to win minerals, where the overburden (see definition below) is literally 'cast' from the working face to the rear as the mineral is exposed.
urban housing capacity study (uhcs)	A study produced for a local planning authority area examining the potential capacity of urban areas to accommodate extra housing on new or redeveloped sites at various densities, or by the conversion of existing buildings.
sub-regional partnership	A sub-regional strategic body directing, influencing and co-ordinating a range of economic development and regeneration activities often made up of key private, public and other interests.
gross development value (gdv)	This is the capital value that the completed property is expected to be worth on the open market when sold to a willing purchaser.
urban capacity study	Studies undertaken to establish how much additional housing can be accommodated within urban areas.
evidence base	The information and data gathered by local authorities to justify the "soundness" of the policy approach set out in Local Development Documents, including physical, economic, and social characteristics of an area.
soundness	To be considered sound, a Development Plan Document must be justified (founded on robust and credible evidence and be the most appropriate strategy) and effective (deliverable, flexible and able to be monitored). This is consistent with PPS12.
planning condition	A condition imposed on a grant of planning permission (in accordance with the Town and Country Planning Act 1990) or a condition included in a Local Development Order or Neighbourhood Development Order.
gasification and pyrolysis (advanced thermal treatment)	A means of recovering energy from waste, known as advanced thermal treatment. Waste is heated at high temperatures and a useable gas is produced.
land compensation	Provisions for the compensation of land compulsorily acquired in the public interest. (See also CPOs)
historic parks and gardens	A park or garden of special historic interest. Graded I (highest quality), II* or II. Designated by English Heritage.
conservation area consent	Consent required for the demolition of an unlisted building within a conservation area.
shoreline management plans	A plan providing a large-scale assessment of the risk to people and to the developed, historic and natural environment associated with coastal processes.
national planning practice guidance (nppg)	The National Planning Practice Guidance adds further context to the National Planning Policy Framework (“NPPF”) and it is intended that the two documents should be read together. The NPPG replaces over 7,000 pages of planning guidance that was previously published in separate documents. It is now available entirely in one place, online and not in hard copy. It is possible sign up for email alerts on any changes the Government makes to it in the future.
wind farm	A group of wind turbines located in areas exposed to wind. A wind farm may vary in terms of the number and size of turbines.
key worker living	A Government scheme running since 2004 helping key workers in London, the South East and East of England to buy a home, upgrade to a family home or rent a home at an affordable price.
energy crops	A 'carbon neutral' energy source contributing to renewable energy. For example, short rotation coppice or willow plantation uses carbon dioxide to grow plants. Crops may then be burned to create energy - hence carbon neutral.
sequential approach / sequential test	A planning principle that seeks to identify, allocate or develop certain types or locations of land before others. For example, brownfield housing sites before greenfield sites, or town centre retail sites before out-of-centre sites.
conditions (or 'planning condition')	Requirements attached to a planning permission to limit, control or direct the manner in which a development is carried out.
primary aggregates	Naturally occurring sand, gravel and crushed rock used for construction purposes.
comparison shopping	Retail items not bought on a frequent basis, for example televisions and white goods (fridges, dishwashers etc).
secondary aggregates	Includes by-product waste, synthetic materials and soft rock used with or without processing as a secondary aggregate.
leasehold (lh)	Ownership of property by way of a leasehold interest for a fixed term, usually with an annual ground rent.
special protection areas (spa)	Areas which have been identified as being of international importance for the breeding, feeding, wintering or the migration of rare and vulnerable species of birds found within European Union countries. They are European designated sites, classified under the Birds Directive.
catchment (in retailing terms)	The geographical area from which a retail destination draws its trade. Sometimes measured in terms of 'Drive Time'.
design commission for wales	The Design Commission for Wales is a national organisation established and core funded by the National Assembly for Wales. DCFW's mission is to champion high standards of architecture, landscape and urban design in Wales and promote a wider understanding of the importance of good quality in the built environment.
landscape appraisal	A method of assessing appearance and essential characteristics of a landscape.
edge of centre	For retail purposes, a location that is well connected and up to 300 metres of the primary shopping area. For all other main town centre uses, a location within 300 metres of a town centre boundary. For office development, this includes locations outside the town centre but within 500 metres of a public transport interchange. In determining whether a site falls within the definition of edge of centre, account should be taken of local circumstances.
vacant possession (vp)	Land or property not subject to any lease, occupation or other adverse interest that would prevent a purchaser or owner taking possession.
target returns	A target return is a pricing model that prices a business based on what an investor would want to make from any capital invested in the company. Target return is calculated as the money invested in a venture plus the profit that the investor wants to see in return, adjusted for the time value of money
local agenda 21	A comprehensive action strategy prepared by local authorities to help achieve sustainable development.
planning policy guidance (ppg)	Issued by central government setting out its national land use policies for England on different areas of planning. These are gradually being replaced by Planning Policy Statements.
remedial work	The work needed to raise the quality of land to an acceptable level before it is used or developed. For example, contaminated land may need pollutants removing.
recycled aggregates	Aggregates produced from recycled construction waste such as crushed concrete and planings from tarmac roads.
highway	A publicly maintained road, together with footways and verges.
disabled access	The means by which disabled people (as defined in the Disability Discrimination Act 1995) can conveniently go where they want.
mineral planning authority (mpa)	The planning authority responsible for planning control of minerals development. County councils are normally responsible for mineral and matters for their area.
community involvement scheme (cis)	In Wales, a statutory statement similar to that of the "Statement of Community Involvment' in England, (See SCI)
statutory body	A government-appointed body set up to give advice and be consulted for comment upon development plans and planning applications affecting matters of public interest. Examples of statutory bodies include: Countryside Agency, English Heritage, English Nature, Environment Agency, Health & Safety Executive, Regional Development Agency, and Sport England.
urban regeneration company (urc)	A dedicated body through which different people combine to co-ordinate the delivery of urban regeneration projects such as major mixed-use developments.
greenfield land or site	Land (or a defined site) usually farmland, that has not previously been developed.
knowledge-based industry	High technology industries (such as computers and office equipment, and pharmaceuticals) and knowledge-based services (for example, telecommunications, information technology, finance, insurance and business services), which are important to economic development.
minerals local plan	A statutory development plan prepared by a minerals planning authority under transitional arrangements, setting out policies for the control of development constituting of the winning and working of minerals or the deposit of mineral waste.
anaerobic digestion	Organic matter broken down by bacteria in the absence of air, producing a gas (methane) and solid (digestate). The by-products can be useful, for example biogas can be used in a furnace, gas engine, turbine or gas-powered vehicles, and digestates can be re-used on farms as a fertiliser.
vernacular building	A building built without being designed by an architect or engineer or someone with similar formal training, often based on traditional or regional forms.
build to rent fund	The Build to Rent Fund was a fully recoverable investment where the government shared risk or bridged finance to help schemes to be built, managed and let. The investment could be used to cover costs such as land, construction or management costs. Developers sold on their interest or refinanced and repaid the investment once a scheme was fully let. See Home Building Fund
mineral development	Any activity related to the exploration for or winning and working of minerals, including tipping of spoil and ancillary operations such as the use of processing plant.
urban regeneration	Making an urban area develop or grow strong again through means such as job creation and environmental renewal.
tower  	A tower block, high-rise, apartment tower, residential tower, apartment block, block of flats, or office tower is a tall building or structure, generally of more than 20 storeys, used as a residential and/or office building. In some areas it may be referred to as an "MDU", (Multi Dwelling Unit). In the United States, such a structure is referred to as an apartment building or office building, while a group of such buildings is called an apartment complex or office complex. 
inert waste	Waste not undergoing significant physical, chemical or biological changes following disposal, as it does not adversely affect other matter that it may come into contact with, and does not endanger surface or groundwater.
controlled waste	Waste that requires a licence for its treatment or disposal.
regionally important geological site (rig)	A non-statutory regionally important geological or geo-morphological site (basically relating to rocks, the Earth's structure and landform).
market towns	Small to medium-sized country towns that are rural service, social and economic centres. Most also hold or used to hold a regular market.
previously developed land or brownfield land	Land which is or was occupied by a permanent structure, including the curtilage and any associated fixed surface infrastructure. This excludes: land occupied by agricultural or forestry buildings; land developed for minerals extraction or waste disposal by landfill purposes where provision for restoration has been made through development control procedures; land in built-up areas such as private residential gardens, parks, recreation grounds and allotments; and land that was previously-developed but where the remains of the permanent structure or fixed surface structure have blended into the landscape in the process of time.
build-to-rent: a best practice guide	Publication by the ULI that lays out best practice principles for the evolving Build to Rent market and the management thereof. 
green corridor / wildlife corridor	Green corridors can link housing areas to the national cycle network, town and city centres, places of employment and community facilities. They help to promote environmentally sustainable forms of transport such as walking and cycling within urban areas and can also act as vital linkages for wildlife dispersal between wetlands and the countryside.
sustainability appraisal (including environmental appraisal)	An appraisal of the economic, environmental and social effects of a plan from the outset of the preparation process to allow decisions to be made that accord with sustainable development.
unitary development plan	An old-style development plan prepared by a metropolitan district and some unitary local authorities, which contains policies equivalent to those in both a structure plan and local plan. These plans will continue to operate for a time after the commencement of the new development plan system, by virtue of specific transitional provisions.
public right of way	A public right of way is a highway over which the public have a right of access along the route.
permitted reserves	Mineral deposits with the benefit of planning permission for extraction.
material consideration	A matter that should be taken into account in deciding a planning application or on an appeal against a planning decision.
multi-tenure	Generally a new build block of apartments and BTR that is made up of differing types of tenure. i.e. social rent, affordable market rent and market rent. 
flood plain	Generally low-lying areas adjacent to a watercourse, tidal lengths of a river or the sea, where water flows in times of flood or would flow but for the presence of flood defences.
wind resource area	An area of search (or an area of least constraint) where wind turbines may be built subject to planning permission.
geodiversity	The range of rocks, minerals, fossils, soils and landforms.
public open space	Urban space, designated by a council, where public access may or may not be formally established, but which fulfils or can fulfil a recreational or non-recreational role (for example, amenity, ecological, educational, social or cultural usages).
cycle network	An integrated network of both on- and off-road routes to facilitate an easier and safer journey for cyclists.
igeneration	See Generation Z
shop fascia	Part of the face or elevation of a shop, displaying the retailer's names.
generation z	Also known as Post-Millennials, the iGeneration, Plurals or the Homeland Generation, is the demographic cohort after the Millennials. There are no precise dates for when the Gen Z cohort starts or ends; demographers and researchers typically use starting birth years that range from the mid-1990s to early 2000s, and as of yet there is little consensus about ending birth years.
ecclesiastical exemption	Ecclesiastical buildings (for example some churches) that are being used for ecclesiastical purposes are exempt from listed building and conservation area controls.
objectives and indicators	Objectives are what are trying to be achieved, and indicators are measures that show whether or not objectives are being achieved. They can be used to help show whether planning policy is effective, or be used in helping to conduct a Sustainability Appraisal.
building management systems (bms)	A building management system (BMS), otherwise known as a building automation system (BAS), is a computer-based control system installed in buildings that controls and monitors the building's mechanical and electrical equipment such as ventilation, lighting, power systems, fire systems, and security systems.
leachate (usually associated with landfill)	Water coming into contact with decomposing waste materials and which has drawn pollutants out of those materials into solution thereby contaminating the water.
equity	Typically, The amount of money an investor contributes to an investment structure or, in real estate terms the difference between the financed element of a property and its value. Occasionally, the property is worth less than the amount of finance. Hence 'negative equity'. 
mineral resource	A potential mineral deposit where the quality and quantity of material present has not been tested.
shadow flicker	The on-and-off flickering effect of a shadow caused when the sun passes behind the rotor of a wind turbine.
zero-carbon home	Over a year, the net carbon emissions from all energy use in the home are zero. This includes energy use from cooking, washing and electronic entertainment appliances as well as space heating, cooling, ventilation, lighting and hot water.
simplified planning zone	An area in which a local planning authority wishes to stimulate development and encourage investment. It operates by granting a specified planning permission in the zone without the need for an application for planning permission and the payment of planning fees.
furnished	A property where the landlord furnishes the property either in whole or in part and may also provide essential kitchen and dining equipment.
town centre strategy	Action plans to sustain and encourage the growth of services and amenities in a town centre through a partnership of the local authority and various organisations and people.
mandate	A mandate is an agreement between the owner and the representing agent regarding the marketing and management of a property. It outlines the agreement duration and obligations for both parties
overlooking	A term used to describe the effect when a development or building affords an outlook over adjoining land or property, often causing loss of privacy.
flight path	The route taken by aircraft between destinations.
capital gains tax (cgt)	A tax on the profit made from the sale of an asset. It's the gain you make that's taxed, not the amount of money you receive. If you’re a basic rate taxpayer, the rate you pay depends on the size of your gain, your taxable income and whether your gain is from residential property or other assets. If this amount is within the basic Income Tax band you’ll pay 10% on your gains (or 18% on residential property). You’ll pay 20% (or 28% on residential property) on any amount above this. If you’re a higher or additional rate taxpayer you’ll pay: 28% on your gains from residential property. 20% on your gains from other chargeable assets.
rectification period (rp)	See Defects Liability Period
development limits & development boundaries	Development limits identify the area within which development proposals would be acceptable, subject to complying with other policies contained in the Development Plan. They seek to prevent development from gradually extending into the surrounding countryside.
tenure	The UK government has four classifications of tenure. They are: Owner Occupied, Rented Privately, Rented from Housing Associations and Rented from Local Authorities. 
multimodal study	A detailed study that considers the problems and solutions affecting all forms of travel along a particular route. Multimodal studies assess against government objectives of accessibility, economy, environment, integration and safety.
internet of things	The Internet of things (IoT) is the inter-networking of physical devices, vehicles (also referred to as "connected devices" and "smart devices"), buildings, and other items—embedded with electronics, software, sensors, actuators, and network connectivity that enable these objects to collect and exchange data.
travel demand management	Planning the travel impacts of existing and new developments to minimise travel needs and provide travel choices for example by efficient car usage (including car sharing), bicycles, and walking and public transport.
back-land development	Development of 'landlocked' sites behind existing buildings, such as rear gardens and private open space, usually within predominantly residential areas. Such sites often have no street frontages.
feuhold	Feuhold is the Scottish equivalent of what is known in England and Wales as freehold. The term basically defines the fact that a property is called a freehold when both the building and its surrounding land area are under the ownership of an individual.
site investigation information	Includes a risk assessment of land potentially affected by contamination, or ground stability and slope stability reports, as appropriate. All investigations of land potentially affected by contamination should be carried out in accordance with established procedures (such as BS10175 (2001) Code of Practice for the Investigation of Potentially Contaminated Sites). The minimum information that should be provided by an applicant is the report of a desk study and site reconnaissance.
building preservation notice	A notice applying to a building all the protection afforded to Listed Buildings on a temporary basis, during which time the Secretary of State will consider whether the building should be granted Listed Building status. The building should be of special historic or architectural interest and be in danger of demolition or alteration harmful to the character of the building.
design for manufacture & assembly	A design approach that focuses on ease of manufacture and efficiency of assembly. By simplifying the design of a product it is possible to manufacture and assemble it more efficiently, in the minimum time and at a lower cost. Traditionally, DfMA has been applied to sectors such as the design of automotive and consumer products, both of which need to efficiently produce high quality products in large numbers. More recently, construction contractors have begun to adopt DfMA for the off-site prefabrication of construction components such as concrete floor slabs, structural columns and beams and so on.
low level restoration	The re-establishment of land following mineral extraction, without infilling (filling the hole created by extraction).
setting	The place or way in which something is set, for example the position or surroundings of a listed building.
city centre	The highest order centre, often a regional or sub-regional retailing and service centre, serving a wide catchment.
health check (in terms of shopping areas)	A survey, using a variety of indicators, to show the 'health' of a town centre or other shopping area. For example, the quality of the environment, footfall, retail sales, commercial yield or amount of customers.
archaeological assessment / evaluation	An assessment of the potential archaeological interest of a site or building. This can be either a desk-based assessment or a field assessment, involving ground survey and small-scale pits or trial trenching carried out by professionally qualified archaeologist(s) looking for historical remains.
guided buses / segregated bus route	Buses for which travel direction is controlled automatically by electronic or kerb guidance along a defined route.
brief / planning brief	A planning brief can include site-specific development briefs, design briefs, development frameworks and master plans that seek to positively shape future development.
waste transfer station	A site to which waste is delivered for sorting or baling prior to transfer to another place for recycling, treatment or disposal.
human rights act	The Human Rights Act 1998 incorporated provisions of the European Convention on Human Rights (ECHR) into UK law. The general purpose of the ECHR is to protect human rights and fundamental freedoms and to maintain and promote the ideals and values of a democratic society. It sets out the basic rights of every person together with the limitations placed on these rights in order to protect the rights of others and of the wider community. There are several articles relevant to planning: Articles 6, 8, 14 and Article 1 of Protocol 1.
local planning authority	The public authority whose duty it is to carry out specific planning functions for a particular area. All references to local planning authority apply to the district council, London borough council, county council, Broads Authority, National Park Authority and the Greater London Authority, to the extent appropriate to their responsibilities.
precautionary principle	Taking action now to avoid possible environmental damage when the scientific evidence for acting is inconclusive but the potential damage could be great.
call-in or called-in planning application	The Secretary of State can "call in" certain planning applications that local authorities propose to approve. For example, where it may have wider effects beyond the immediate locality, significant regional or national controversy, or potential conflict with national policy. These will then be subject to a public inquiry presided over by a Planning Inspector who will make recommendation to the Secretary of State who will decide the application instead of the local planning authority.
standards authority	A local planning authority producing an improvement plan, having failed to meet one or more government Best Value performance target for development control, relating to efficient planning application processing.
void space	The capacity within landfill sites for more waste allowing for final restoration and landscaping work.
sdlt surcharge (higher rates for additional homes)	From 1 April 2016, the rate of the SDLT charge for purchases of an additional residential property (such as a buy-to-let property or second home) became 3% above the existing residential rates on the whole of the purchase figure. Surprisingly levied upon the Institutional Investors by the Government, the surcharge is deeply resented by the sector.
general permitted development order (gpdo)	A set of regulations made by the Government which grants planning permission for specified limited or minor forms of development.
regional / local gateways	Airports, main rail stations, ports, and motorways that form a traveller's first point of contact with the area.
planning gain	The benefits or safeguards, often for community benefit, secured by way of a planning obligation as part of a planning approval and usually provided at the developer's expense. For example, affordable housing, community facilities or mitigation measures.
bring systems (public recycling facilities)	Recycling schemes where the public deliver their recyclables to a central collection point, such as those in supermarket car parks for bottles and cans.
conservation area	Local authorities have the power to designate as conservation areas, any area of special architectural or historic interest. This means the planning authority has extra powers to control works and demolition of buildings to protect or improve the character or appearance of the area. Conservation Area Consent has been replaced by planning permission for relevant demolition in a conservation area.
retail impact assessment	An assessment undertaken for an application for retail use (normally on developments over 2,500 square metres gross floorspace, but they may occasionally be necessary for smaller developments, such as those likely to have a significant impact on smaller centres) on the impact of the proposal on the vitality and viability of existing centres within the catchment area of the proposed development. The assessment includes the likely cumulative effect of recent permissions, developments under construction and completed developments.
millennials	Also known as Gen' Y, the demographic cohort following Generation X. There are no precise dates for when this cohort starts or ends; demographers and researchers typically use the early 1980s as starting birth years and the mid-1990s to early 2000s as ending birth years
business improvement districts (bid)	Designated town centre management (and sometimes other areas) where businesses agree to pay additional rates to fund improvements to the general retail environment.
joint venture (jv)	A joint venture (JV) is a business arrangement in which two or more parties agree to pool their resources for the purpose of accomplishing a specific task. This task can be a new project or any other business activity. In a joint venture (JV), each of the participants is responsible for profits, losses and costs associated with it. However, the venture is its own entity, separate and apart from the participants' other business interests. 
quality bus route	High-quality, high-frequency bus route usually operated by low floor vehicles along routes often with a higher degree of bus priority measures installed to speed up journey times.
biodiversity	The whole variety of life encompassing all genetics, species and ecosystem variations, including plans and animals.
conservation (for heritage policy)	The process of maintaining and managing change to a heritage asset in a way that sustains and, where appropriate, enhances its significance.
green infrastructure	A network of multi-functional green space, urban and rural, which is capable of delivering a wide range of environmental and quality of life benefits for local communities.
reasoned justification	The supporting text in a development plan or Local Development Document explaining and justifying the approach set out in the policies contained in the document.
affordable housing	Social rented, affordable rented and intermediate housing, provided to eligible households whose needs are not met by the market. Eligibility is determined with regard to local incomes and local house prices. Affordable housing should include provisions to remain at an affordable price for future eligible households or for the subsidy to be recycled for alternative affordable housing provision.
ecosystem services	The benefits people obtain from ecosystems such as, food, water, flood and disease control and recreation.
annual monitoring report (amr)	A report submitted to the Government by local planning authorities assessing progress with and the effectiveness of a Local Development Framework.
distribution	Distribution refers to a company's payment of stock, cash or physical products to its shareholders. Mutual fund companies give earnings and other pay-outs to shareholders as a distribution. Distribution is an allocation of capital gains and income that mutual funds generate for their investors periodically during a calendar year. Distribution is a payment of interest, principal or dividend by the issuer of a security to the shareholders on a regular basis.
life cycle analysis	A technique intended to quantify the total impact of a product during its production, distribution, use and recycling, treatment or disposal. Can be applied to sustainable waste management.
private open space	Open space that is usually privately owned and is not usually accessible by members of the public.
s curve forecasting (scf)	S-curve model or function, with cumulative labour and construction costs budgeted out through the life of the project. Deviations from the curve are then continuously monitored on an on-going basis through variance analysis and through using project reporting accounting software packages.
cultural strategy	A Cultural Strategy aims to "promote the cultural well-being" of the area it covers.
national trails	Long distance routes for walking, cycling and horse riding.
turnover	Amount of sales per unit area of retail floorspace.
real estate investment trust (reit)	A Real Estate Investment Trust (REIT) is a single company or a group that owns and manages property on behalf of shareholders. A REIT can contain commercial and/or residential property but excludes the letting of owner-occupied buildings. In the UK, a company or group of companies can apply for ‘UK-REIT’ status, which exempts the company from corporation tax on profits and gains from their UK qualifying property rental businesses. In return, UK-REITs are required to distribute at least 90% of their taxable income, for each accounting period, into the hands of investors, where the income is treated as property rental income.
inspector's report	A report issued by an planning inspector regarding the planning issues debated at the independent examination of a development plan or a planning inquiry. Reports into Development Plan Documents (DPDs) will be binding upon local authorities.
institutional private rented sector	This is the tenure of market-rented properties in the UK, sitting alongside social rented and owner occupation as the three main rental tenures. In this instance, it describes large scale institutional investment, normally in apartment blocks of more than 100 units. A sub-set of iPRS would be Build to Rent. 
community strategy	A strategy prepared by a local authority to improve local quality of life and aspirations, under the Local Government Act 2000.
waste regulation authority	The Environment Agency has responsibility for authorising waste management licences for disposal facilities, and for monitoring sites.
overbearing	A term used to describe the impact of a development or building on its surroundings, particularly a neighbouring property, in terms of its scale, massing and general dominating effect.
community forest	An area identified through the England Community Forest Programme to revitalise countryside and green space in and around major conurbations.
green belt	A designation for land around certain cities and large built-up areas, which aims to keep this land permanently open or largely undeveloped. The purposes of the green belt is to: • Check the unrestricted sprawl of large built up areas. • Prevent neighbouring towns from merging. • Safeguard the countryside from encroachment. • Preserve the setting and special character of historic towns. • Assist urban regeneration by encouraging the recycling of derelict and other urban land. Green Belts are defined in a local planning authority's development plan.
cuoa	"Compulsive Use Of Acronyms"
hazardous waste	Wastes that have the potential to cause harm to human health or the environment.
cumulative impact	A number of developments in a locality or a continuous activity over time that together may have an increased impact on the environment, local community or economy.
new build	A newly constructed property that has not previously been lived in. 
statement of comprehensive income (soci)	This is simply an extension of the income statement. The reason for this is that some gains the business makes during the year are not realised gains. The main example is the revaluation of tangible assets. The gain is not realised until the asset is sold and converted into cash. The revaluation represents a hypothetical gain (i.e. what gain would a company make if the asset was sold).
municipal solid waste (msw)	Household waste and any other waste collected by a waste collection authority such as municipal parks and gardens waste, beach cleansing waste and waste resulting from the clearance of fly-tipped materials.
departure	A proposed development that is not in accordance with the adopted development plan, but for which the local planning authority proposes to grant planning permission (subject to no intervention from the Government).
equitable interest	An equitable interest is an "interest held by virtue of an equitable title (a title that indicates a beneficial interest in property and that gives the holder the right to acquire formal legal title) or claimed on equitable grounds, such as the interest held by a trust beneficiary.
commitments (or committed development)	All land with current planning permission or allocated in adopted development plans for development (particularly residential development).
written statement	A documentary statement supplementing and explaining policy, forming part of a development plan.
viability assessment	Generally an assessment to identify the viability of a scheme. Viability may have a number of parameters based on differing imperatives: Investment return, capital value, GDV, affordable housing/S106 provision etc.
limits of development	Limits of development identify the area within which development proposals would be acceptable, subject to complying with other policies contained in the Development Plan. They seek to prevent development from gradually extending into the surrounding countryside.
portfolio	A group of properties which are held in one ownership. Decisions taken in respect of any issue are reached on the basis of achieving the maximum benefit for the owners, having regard to the effect on the portfolio as a whole rather than on an individual property.
greenhouse gases	Naturally occurring examples include water vapour, carbon dioxide, methane, nitrous oxide and ozone. Some human activities increase these gases, including fossil fuel combustion within motor vehicles and some power stations.
multiple retailer	A company chain of stores.
waste planning authority (wpa)	The local authority responsible for waste development planning and control. They are unitary authorities, including National Park Authorities, and county councils in non-unitary areas.
habitat	An area of nature conservation interest.
crowd-funding	Crowdfunding is the use of small amounts of capital from a large number of individuals to finance a new business venture. Crowdfunding makes use of the easy accessibility of vast networks of people through social media and crowdfunding websites to bring investors and entrepreneurs together.
geographic information system (gis)	A computer-based system whereby mapping and information are linked for a variety of uses, such as capturing data justifying Local Development Documents.
delegated powers	A power conferred to designated planning officers by locally elected councillors so that the officers may take decisions on specified planning matters behalf of the council.
distributor road	Roads that distribute traffic and bus services within the main residential, commercial and industrial built-up areas.
agricultural (forestry or other rural occupational) dwelling	A dwelling which is subject to a planning condition or legal agreement restricting occupation to someone employed, or was last employed, in agriculture, forestry or other appropriate rural employment.
building	The term building refers to the whole or any part of any structure or erection. It does not include plant or machinery comprised in a building.
multi-use games area (muga)	An enclosed area, using a synthetic grass or hard surface for playing sports, for example five-a-side soccer or netball.
localism act	The Localism Act has devolve greater powers to councils and neighbourhoods and given local communities more control over housing and planning decisions.
borrow pit	A temporary mineral working to supply material for a specific construction project.
ribbon development	Development, usually residential, extending along one or both sides of a road but not extended in depth.
first secretary of state	The lead Minister for all policies relating to Town & Country Planning, having powers of intervention on Development Plans and Planning Casework under certain circumstances.
association of residential letting agents (now arla propertymark) (arla)	ARLA Propertymark protects and guides consumers, helping tenants and landlords to find and manage their homes. They work to raise professional standards among letting agents from single branch independents to large national groups, promoting education and qualifications within the sector. Nearly 9,000 letting agents are ARLA Propertymark Protected, and claim to meet higher standards than the law demands.
buy-to-let	Buy-to-let is a British phrase referring to the purchase of a property specifically to let out, that is to rent it out. A buy to let mortgage is a mortgage specifically designed for this purpose.
significance (for heritage policy)	The value of a heritage asset to this and future generations because of its heritage interest. That interest may be archaeological, architectural, artistic or historic. Significance derives not only from a heritage asset’s physical presence, but also from its setting.
landfill gas	The gas generated in any landfill site accepting biodegradable material. It consists of a mixture of gases, mainly methane and carbon dioxide.
porter	A person, in the UK, not dissimilar to the concierge. In the US, the term 'porter' tends to mean an individual responsible for maintaining the fabric of the building on a day to day basis. Generally, cleaning and ensuring the building is clean and tidy with some light maintenance duties.
social inclusion	Positive action taken to include all sectors of society in planning and other decision-making.
change of use	A change in the way that land or buildings are used (see Use Classes Order). Planning permission is usually necessary in order to change from one 'use class' to another.
woof	"Well Off Older Folk"
best available techniques (bat)	In terms of assessing the potential effects of pollution, a system that aims to balance the costs to the operator against the benefits to the environment.
appreciation	Appreciation is an increase in the value of an asset over time. The increase can occur for a number of reasons, including increased demand or weakening supply, or as a result of changes in inflation or interest rates. This is the opposite of depreciation, which is a decrease over time.
site of nature conservation importance (snci) or site of biological interest (sbi)	Locally important sites of nature conservation adopted by local authorities for planning purposes. (See also Local Nature Reserve).
visibility splay	Access around a road junction or access, which should be free from rival obstruction to evade motorists to see there traffic and pedestrians.
area of search	A broad area within which sites are sought for development, for example, for housing, mineral extraction, or renewable energy.
enforcement action	Procedures by a local planning authority to ensure that the terms and conditions of a planning decision are carried out, or that development carried out without planning permission is brought under control.
section 8 notice	Served upon a tenant where the tenant has broken the terms of the tenancy. Also known as the Section 8 notice to quit or the Section 8 possession notice, is a prerequisite if the landlord of an assured tenancy wishes to obtain possession order from the court, thereby ending the tenancy, for a reason based on a circumstance entitling the landlord to possession. It is used in England and Wales and is part of the Housing Act 1988
overage	"Overage" is the term normally used, in the context of a property transaction, to mean a sum which the vendor may be entitled to receive after completion if a specified condition is satisfied; the condition may be: The grant of a new planning permission; or The grant of planning permission for a new (perhaps more valuable) use of the land; or The construction of more than a specified number of houses, or a larger than specified commercial development on the land; or The on-sale of the land in its present state, where the vendor fears the purchaser may take advantage of a rapidly rising market to make a quick profit from the land.
breach of conditions notice	A notice served by a local planning authority where they suspect that a planning condition linked to a planning permission has been breached.
enforcement notice	A notice served by a local planning authority setting out the remedial action necessary to put right work or correct an activity that appears to have been undertaken without planning permission.
overburden	Soil and other material that overlays a mineral deposit, and which has to be excavated and either tipped or stockpiled to gain access to the underlying mineral.
illegal eviction	Illegal eviction is a criminal offence. ... It's a criminal offence for a landlord to evict you without following the correct legal steps for eviction. The rules for eviction depend on whether you are a private tenant, a council tenant or a housing association tenant.
amenity green-space	Open land, often landscaped, that makes a positive contribution to the appearance of an area or improves the quality of the lives of people living or working within the locality. It often provides opportunities for activities such as sports, and can serve other purposes such as reducing the noise from a busy road or providing shelter from prevailing winds.
aerobic digestion	Biological treatment of biodegradable organic waste in the presence of oxygen, producing a residue suitable for use as a soil improver.
buffer zone	An area of land separating certain types of development from adjoining sensitive land uses. Often used in relation to minerals and/or waste development.
clusters (a term used in economic regeneration)	A group of businesses or organisations who, owing to the goods they produce and/or services they provided have common customers, technology or use similar specialist skills. They group together in order to enhance their overall competitive advantage of individual companies.
bonds	Bonds are a form of financial investment that involve lending money to an institution for a fixed period of time. They can be corporate or government bonds. The bond will contain details of its interest rate (its coupon) from the outset. Since your initial investment is returned to you after the bond expires (its maturity date), this is the only profit that bonds pay. Bond values are set at a par, typically either £100 or £1,000. This represents the face value, or amount that the initial investment will be worth at the bond’s maturity. Interest rates are a calculation of the credit status of the issuer and duration of the loan.
ramsar sites	Wetlands of international importance, designated under the 1971 Ramsar Convention.
planning advisory service	A service to help and advise local planning authorities struggling to meet best value performance targets for development control.
construction and demolition waste	Controlled waste arising from the construction, repair, maintenance and demolition of buildings and structures.
bulky goods	Goods of a large physical nature (for example DIY, furniture, carpets) that sometimes require large areas for storage or display.
decentralised energy	Local renewable energy and local low-carbon energy usually but not always on a relatively small scale encompassing a diverse range of technologies.
professional prs	A term to used to distiguish between the BTL market and corporate ownership of PRS assets. Can alo be applied to Institutional PRS (see iPRS) and Build to Rent (BtR)
fly tipping	The illegal disposal of waste on land.
vernacular	The way in which ordinary buildings were built in a particular place, making use of local styles, techniques and materials.
county court judgement (ccj)	A County Court Judgment (CCJ) is a type of court order in England, Wales and Northern Ireland that might be registered against you if you fail to repay money you owe. This page tells you more about what to do if you receive a County Court claim form. In Scotland the process is called enforcing a debt by diligence.
listed building	A building of special architectural or historic interest. Listed buildings are graded I, II* or II with grade I being the highest. Listing includes the interior as well as the exterior of the building, and any buildings or permanent structures (e.g. wells within its curtilage).
culture	Culture includes arts, media, sports, libraries, museums, parks, and the countryside, built heritage, tourism, and the creative industries.
high net worth (hnw)	High net worth individual (HNWI) is a classification used by the financial services industry to denote an individual or a family with high net worth. Although there is no precise definition of how rich somebody must be to fit into this category, high net worth is generally quoted in terms of liquid assets over a certain figure. The exact amount differs by financial institution and region.
churn	The process of selling assets once they become vacant and replacing with additional assets. Increases rent to the Investor in the form of a capital gain but has CGT implications. REIT's are generally precluded from 'Churn'
statutory	Required by law (statute), usually through an Act of Parliament.
sharer	A person who shares a room or property with one or more other people who are not family members.
energy saving trust (est)	Non-profit organisation, funded both by the Government and the private sector set up to address the damaging effects of climate change. Its aim is to cut emissions of carbon dioxide by promoting the sustainable and efficient use of energy.
sterilisation	When development or land use changes prevent possible mineral exploitation in the foreseeable future.
protected species	Plants and animal species afforded protection under certain Acts and Regulations.
special needs housing	Housing to meet the needs of groups of people who may be disadvantaged, such as the elderly, the disabled, students, young single people, rough sleepers, the homeless, those needing hostel accommodation, key workers, travellers and occupiers of mobile homes and houseboats.
new town	A newly planned settlement. The first new towns were planned urban communities under the 1946 New Towns Act. Their main purpose was to reduce congestion in major cities through the creation of attractive urban units that would provide local employment for their residents.
village envelope	A boundary around a village, or part of a village, usually quite tightly drawn, within which development might be allowed in principle.
planning casework service	An online service designed and managed by the Planning Inspectorate and accessed through the Planning Portal. The service lets users in England submit and track different kinds of appeals electronically and search and comment on appeals online. The service is not currently available in Wales.
job seekers allowance (jsa)	As with DHSS applicants, private landlords prefer not to take JSA tenants.
lessor	A person who leases or lets a property to another; a landlord.
county archaeologist	An officer within a County Council responsible for maintaining and compiling Sites and Ancient Monuments Records on behalf of English Heritage, and advising on development affecting archaeological remains.
waste local plan	A statutory development plan prepared (or saved) by the waste planning authority under transitional arrangements, setting out polices in relation to waste management and related developments.
section 106a (s106a)	An application whereby the developer, within a five year period, applies to vary the agreed terms of a section 106 agreement.
planning permission	Formal approval sought from a local planning authority allowing a proposed development to proceed. Permission may be sought in principle through outline planning applications, or be sought in detail through full planning applications.
oinky	"One Income No Kids Yet"
first time buyers initiative	Part of Communities and Local Government's HomeBuy low-cost home-ownership initiative. It is positioned to target key workers and other eligible groups that have sufficient income to sustain home ownership but are currently prevented from entering the housing market by the prevailing demand/supply conditions.
biological treatment	Any biodegradable (breaking down) process that changes the properties of waste, such as anaerobic digestion and composting.
improvement and development agency for local government (idea)	Body owned by the Local Government Association that works for local government so councils can serve people and places better. It lets councils share best practice, promote the development of local government's management and workforce, advise councils on customer service and value for money and also helps councils work through local partnerships to tackle local priorities such as health, children's services and economic development.
design guide	A document providing guidance on how development can be carried out in accordance with good design practice often produced by a local authority with a view to retaining local distinctiveness.
planning out crime	The planning and design of street layouts, open space, and buildings so as to reduce the actual likelihood or fear of crime, for example by creating natural surveillance.
mechanical biological treatment (mbt)	The treatment of residual waste using a combination of mechanical separation and biological treatment.
retail price index (rpi)	The retail price index (RPI) and the consumer price index (CPI) are both measures of the price of goods and services. The RPI shows the changes in the cost of living. It reflects the movement of prices in a range of goods and services used regularly, such as food, heating, housing, household goods, bus fares and petrol. Items considered most important to us, such as housing and food, are given a higher weighting in the overall index, while items, such as tobacco, are given a lower weighting. RPI includes some components that are not included in CPI such as some elements of owner-occupied housing, such as mortgage interest payments.
dwelling and dwelling house	A self-contained building or part of a building used as a residential accommodation, and usually housing a single household. A dwelling may be a house, bungalow, flat, maisonette or converted farm building.
heritage coast	Areas of undeveloped coastline which are managed to conserve their natural beauty and, where appropriate, to improve accessibility for visitors.
home building fund (hbf)	The government has created a £3 billion fund to increase the number of homes built in England. You can apply if you’re a private sector business that builds new homes or prepares sites for housing developments. This includes small builders, community builders, custom builders and regeneration specialists, as well as larger builders and developers. The Home Building Fund is managed by the Homes and Communities Agency (HCA) on behalf of the government. HCA is the national housing, land and regeneration agency in England.
neighbourhood plans	A plan prepared by a Parish Council or Neighbourhood Forum for a particular neighbourhood area (made under the Planning and Compulsory Purchase Act 2004).
net return	Net return is the income return on an investment after expenses have been deducted. The expenses or operational costs associated with an investment property can be significant and can include acquisition and transactions costs, management fees, repairs and maintenance costs, rates and insurance. Net yield is determined by first subtracting the property’s annual operational costs from its annual rent and then dividing this by the property value
need (in retail terms)	The balance of supply and demand between retailers and consumers. Often expressed as personal expenditure available to support additional shops to extensions to existing shops.
mixed use (or mixed use development)	Provision of a mix of complementary uses, such as residential, community and leisure uses, on a site or within a particular area.
department of communities & local government (dclg)	A UK Government department for communities and local government in England. It was established in May 2006 and is the successor to the Office of the Deputy Prime Minister, established in 2001. Its headquarters is located at 2 Marsham Street, London. The Department for Communities and Local Government's job is to create great places to live and work, and to give more power to local people to shape what happens in their area.
outstanding planning permission	A current planning permission that has yet to be implemented.
planning portal	A national website for members of the public, local planning authorities and planning consultants. The Planning Portal features a wide range of information and services on planning.
cabe	Commission for Architecture and the Built Environment. A public body acting as a champion of good design in England.
roundtable discussions	A forum in which people making representations upon a Development Plan Document can express their views before a Government appointed Planning Inspector.
gearing	Gearing refers to the level of a company’s debt related to its equity capital, usually expressed in percentage form. It is a measure of a company’s financial leverage and shows the extent to which its operations are funded by lenders versus shareholders. The term "gearing" also refers to the ratio between a company’s stock price and the price of its warrants.
(aqma) air quality management areas	Areas designated by local authorities because they are not likely to achieve national air quality objectives by the relevant deadlines.
density	In the case of residential development, a measurement of either the number of habitable rooms per hectare or the number of dwellings per hectare.
leasehold knowledge partnership (lkp)	The Leasehold Knowledge Partnership is a private organisation which exists to protect ordinary leaseholders. The organisation helps the leaseholder navigate sometimes complex elements within the leasehold structure to ensure they have a voice against the often professional interests of the landlord.
tenancy deposit scheme	Under the provisions of the United Kingdom Housing Act 2004 every landlord or letting agent that takes a deposit for an assured shorthold tenancy in England and Wales must protect the deposit under an authorised tenancy deposit scheme. The new regulations came into effect from 6 April 2007, and were amended by the Localism Act 2011, taking effect from 6 April 2012. The Deregulation Act 2015 further amended the regulations from 26 March 2015. Currently, there are three companies authorised: The Tenancy Deposit Scheme (TDS),  MyDeposits, The Deposit Protection Service (The DPS)
groundwater	An important part of the natural water cycle present underground, within strata known as aquifers.
dormant site	A site with planning permission on which mineral operations has now ceased.
local strategic partnership (lsp)	An overall partnership of people that brings together organisations from the public, private, community and voluntary sector within a local authority area, with the objective of improving people's quality of life.
character	A term relating to Conservation Areas or Listed Buildings, but also to the appearance of any rural or urban location in terms of its landscape or the layout of streets and open spaces, often giving places their own distinct identity.
hard rock	Consolidated rock such as limestone and granite.
intermediate rent	See: 'Affordable Private Rent'
life-cycle cost analysis (lcca)	Life-cycle cost analysis (LCCA) is a tool to determine the most cost-effective option among different competing alternatives to purchase, own, operate, maintain and, finally, dispose of an object or process, when each is equally appropriate to be implemented on technical grounds.
proptech	PropTech is a buzzword gaining currency in media, tech and property circles. It refers to the wave of companies using technology to refine, improve or reinvent the services we rely on in the property industry to buy, rent, sell, build, heat or manage residential and commercial property
financial conduct authority (fca)	The FCA regulate the financial services industry in the UK. Their aim is to protect consumers, ensure the industry remains stable and promote healthy competition between financial services providers.
primary shopping area	Defined area where retail development is concentrated (generally comprising the primary and those secondary frontages which are adjoining and closely related to the primary shopping frontage).
fossil fuels (a non-renewable fuel)	Carbon-rich fuel (coal, oil and natural gas) formed from the remains of ancient animals and plants. Their combustion is considered to contribute to the 'greenhouse effect'.
royal institution of chartered surveyors (rics)	RICS are a professional body that accredits professionals within the land, property and construction sectors worldwide. RICS regulate and promote the profession; maintain the highest educational and professional standards; protect clients and consumers via a strict code of ethics; and provide impartial advice and guidance.
terracing effect	A term used to describe the closing of gaps between houses by extending the houses sideways, for example a double garage between semi-detached properties.
curator	A term used as an alternative to 'Concierge' which some perceive as being identified too strongly with the Leisure industry. Curators integrate with the customer and possess both property management and inter-personal skills. They will be knowledgeable about the local environment
section 75 (s75)	Section 75 Agreements in Scotland, know as section 106 Agreements in England and Wales are planning obligation contracts entered into between a landowner and the planning authority
term	The duration of the tenancy.
gross internal area (gia)	Gross Internal Floor Area is the area of a building measured to the internal face of the perimeter walls at each floor level, which includes: Areas occupied by internal walls and partitions. Columns, piers chimney breasts, stairwells, lift-wells, other internal projections, vertical ducts, and the like.
debt guarantee scheme (dgs)	The Government sponsored scheme, first introduced in 2012, aims to accelerate the growth of investment in the private rented sector by institutional investors, through the creation of a government guaranteed bond programme that will be used to finance long-term loans to eligible PRS operators. To be eligible, properties must be completed, with stable incomes and a value over £10 million. The Scheme is administered by Venn Partners
climate change mitigation	Action to reduce the impact of human activity on the climate system, primarily through reducing greenhouse gas emissions.
rural diversification	The expansion, enlargement or variation of the range of products or fields of operation of a rural business (branching out from traditional farming activities, for example new income generating enterprise like renewable energy, tourism and food processing).
equities	An instrument that signifies an ownership position, or equity, in a corporation, and represents a claim on its proportionate share in the corporation's assets and profits. A person holding such an ownership in the company does not enjoy the highest claim on the company's earnings. Instead, an equity holder's claim is subordinated to creditor's claims, and the equity holder will only enjoy distributions from earnings after these higher priority claims are satisfied. also called equities or equity securities or corporate stock.
rider	A contract rider is an attachment to a contract. It can be a schedule, an amendment or any other writing that may modify the original contract. Riders allow contract drafters to avoid rewriting an entire contract.
ward	A small sub-area of a local authority district.
asset class	An asset class is a group of securities that exhibits similar characteristics, behaves similarly in the marketplace and is subject to the same laws and regulations. The three main asset classes are equities, or stocks; fixed income, or bonds; and cash equivalents, or money market instruments. Various types of real estate can also be identified by 'Asset class' Build to Rent investments are now distinct from other real estate types as a separate asset class.
the tenancy protection service	One of three Government  authorised firms protecting deposits for tenants
birds and habitats directives	European Directives to conserve natural habitats and wild fauna and flora.
adoption	The final confirmation of a development plan or Local Development Document status by a local planning authority (LPA).
development risk	Risks associated with developing a building: Increase in Interest Rate, Increase in cost of human resources, planning risk, increase in commodities risk, downturn in market values. Poorly assessed cost plan. 
city region	The concept of the city-region can be understood as a functionally inter-related geographical area comprising a central, or Core City, as part of a network of urban centres and rural hinterlands. A little bit like the hub (city) and the spokes (surrounding urban/rural areas) on a bi-cycle wheel.
rent deposit guarantee scheme	Rent deposit schemes help people who can't afford a tenancy deposit to rent from a private landlord. Rent deposit schemes are usually run by a local council or housing association or sometimes by a charity. Usually, the scheme lends you the money in advance and you pay it back over a period of time from your wages or benefits. If you pay a deposit to your landlord, your money must be protected with a tenancy deposit protection scheme. This applies if you have an assured shorthold tenancy. Most private tenants have this tenancy type. You should get your deposit back as a lump sum at the end of your tenancy If there are no problems.
real time information (rti)	Electronically displayed and up-to-the-minute bus or train arrival information at public transport stops.
minerals reserves	Mineral deposits which have been tested to establish the quality and quantity of material present and which could be economically and technically exploited.
stamp duty land tax (sdlt)	Stamp duty land tax (SDLT) has applied since 1 December 2003 when it replaced stamp duty on UK land and buildings. SDLT is charged in bands which increase as the value of the property increases. SDLT was restructured on purchases of residential property with effect from 4 December 2014 so that the charge is now made at different rates depending on the portion of the purchase price that falls within each rate band. SDLT on non-residential property is still calculated as a ‘slab tax’ whereby a single rate, determined by the value, is applicable to the whole amount.
refuse derived fuel (rdf)	A fuel product produced from the combustible fraction of waste.
multiplier effect	The extended impact of an economic action upon business activity and/or upon employment. For example, a new major business may place orders with a smaller one helping to create extra jobs.
high hedges	High Hedges are dealt with under Part 8 of the Anti-Social Behaviour Act 2013 (available at: http://www.opsi.gov.uk/acts/acts2003/20030038.htm)
listed building enforcement notice	A notice issued by a local planning authority if work is carried out on a Listed Building without consent, and requiring that the building be brought back to its former state or other remedial works.
secondary shopping frontages	A retailing area, secondary to the primary shopping frontage, that provides greater opportunities for a diversity of uses.
footfall / pedestrian flow	The numbers and movements of people to provide an indicator of the commercial health of a shopping centre, whilst also informing potential businesses of the likely level of passing trade.
best practicable environmental option (bpeo)	There are many different ways of dealing with waste, and the BPEO is basically the waste management option that provides the most benefit or least damage to the environment as a whole, at an acceptable cost, in both the short and long term. For example, recycling versus landfill.
dinky	Dual Income No Kids Yet" Pretty much self explanatory. 
elevation	The actual facade (or face) of a building, or a plan showing the drawing of a facade.
front-loading	Community involvement in the production of Local Development Documents to gain public input and seek consensus from the earliest opportunity.
local planning authority (lpa)	 local planning authority (LPA) is the local authority or council that is empowered by law to exercise statutory town planning functions for a particular area of the United Kingdom. Although, in Scotland, where all of the local authorities are unitary, the term 'planning authority' is used without the 'local' prefix.
unstable land	Land that may be unstable (due to a range of factors) for which planning proposals should give due consideration.
safeguarding zone	An area defined in Circular 01/03: Safeguarding aerodromes, technical sites and military explosives storage areas, to safeguard such sites.
betterment	Means through the tax system of capturing the development value of land for the benefit of the community.
household waste	Refuse from household collection rounds, waste from street sweepings, public litter bins, bulky items collected from households and wastes which householders themselves take to household waste recovery centres and "bring sites".
net present value (npv)	Net Present Value (NPV) is the difference between the present value of cash inflows and the present value of cash outflows. NPV is used in capital budgeting to analyse the profitability of a projected investment or project. 
strategic environmental assessment (sea)	A procedure (set out in the Environmental Assessment of Plans and Programmes Regulations 2004) which requires the formal environmental assessment of certain plans and programmes which are likely to have significant effects on the environment.
preferred areas	An area within a mineral consultation area containing mineral resources which can be identified with a high degree of provision and where there is a strong presumption in favour of extraction.
statutory undertakers / statutory utilities	Bodies carrying out functions of a public character under a statutory power. They may either be in public or private ownership such as Post Office, Civil Aviation Authority, the Environment Agency or any water undertaker, any public gas transporters, supply of electricity etc.
section 73 (s73)	Section 73 of the Town and Country Planning Act 1990 'determination of applications to develop land without conditions previously attached' permits application to remove planning conditions or to vary planning conditions following the grant of planning permission. This may include minor 'material' amendments to a consent. 
development control & development management	The process whereby a local planning authority receives and considers the merits of a planning application and whether it should be given permission having regard to the development plan and all other material considerations.
depreciation	In strict terms, the fall in asset value due to market conditions. In accounting terms, depreciation is a term used to describe the cost of using an asset over a period of time
waste hierarchy	A framework for securing a sustainable approach to waste management. Waste should be minimised wherever possible. If waste cannot be avoided, then it should be re-used; after this value recovered by recycling or composting; or waste to energy; and finally landfill disposal.
affordable housing provision	Affordable housing is social rented, affordable rented and intermediate housing, provided to eligible households whose needs are not met by the market. Eligibility is determined with regard to local incomes and local house prices. Affordable housing should include provisions to remain at an affordable price for future eligible households or for the subsidy to be recycled for alternative affordable housing provision
proximity principle	Requires that waste should be managed as near as possible to its place of production, reducing travel impacts.
planning policy statement (pps)	Issued by central government to replace the existing Planning Policy Guidance notes in order to provide greater clarity and to remove from national policy advice on practical implementation, which is better expressed as guidance rather than policy.
gross external area (gea)	The UK government's Valuation Office Agency (VOA) Code of measuring practice: definitions for rating purposes suggests that 'gross external area' refers to the whole area of a building taking each floor into account, including perimeter walls. ...Areas occupied by internal walls (whether structural or not) and partitions
structural insulated panels	Structural insulated panels (SIPs) are a high performance building system for residential and light commercial construction. The panels consist of an insulating foam core sandwiched between two structural facings, typically oriented strand board (OSB).  SIPs are manufactured under factory controlled conditions and can be fabricated to fit nearly any building design. The result is a building system that is extremely strong, energy efficient and cost effective. 
infrastructure	Basic services necessary for development to take place, for example, roads, electricity, sewerage, water, education and health facilities.
regional aggregates working party	A working group consisting of local authority officers, representatives of the aggregates industry and central government established to consider the supply and demand for aggregate minerals.
offshore renewable energy projects	Projects that involve electricity generation methods such as offshore wind or wave generators. Central government may deal with these rather than local planning authorities.
green wedges	Green wedges comprise the open areas around and between parts of settlements, which maintain the distinction between the countryside and built up areas, prevent the coalescence (merging) of adjacent places and can also provide recreational opportunities.
investment value (iv)	Investment value is the value of a property to a particular investor. In the U.S. and U.K., it is equal to market value for the investor who has the capacity to put the property to good use—its highest-and-best-use, its most valuable use.
retail floorspace	Total floor area of the property that is associated with all retail uses. Usually measured in square metres. May be expressed as a net figure (the sales area) or in gross (including storage, preparation and staff areas).
designated heritage asset	A World Heritage Site, Scheduled Monument, Listed Building, Protected Wreck Site, Registered Park and Garden, Registered Battlefield or Conservation Area designated under the relevant legislation.
primary and secondary frontages	Primary frontages are likely to include a high proportion of retail uses which may include food, drinks, clothing and household goods. Secondary frontages provide greater opportunities for a diversity of uses such as restaurants, cinemas and businesses.
ancient woodland	An area that has been wooded continuously since at least 1600 AD.
national planning policy framework (nppf)	The National Planning Policy Framework was published by the UK's Department of Communities and Local Government in March 2012, consolidating over two dozen previously issued documents called Planning Policy Statements (PPS) and Planning Policy Guidance Notes (PPG) for use in England.
maisonette	 An apartment occupying two or more floors of a larger building and often having its own entrance from outside.
place making	Place making is a multi-faceted approach to the planning, design and management of public spaces. Place making capitalizes on a local community's assets, inspiration, and potential, with the intention of creating public spaces that promote people's health, happiness, and well being.
overshadowing	The effect of a development or building on the amount of natural light presently enjoyed by a neighbouring property, resulting in a shadow being cast over that neighbouring property.
eco-towns	Exemplar "green developments". They will meet the highest standards of sustainability, including low and zero carbon technologies and quality public transport systems. They will make use of brownfield land and surplus public sector land where practical and lead the way in design, facilities and services, and community involvement.
management plan	A plan for the detailed, sometimes day-to-day management or conservation of important areas, including nature conservation, archaeology, or historic sites, in order to maintain and enhance those special features or qualities.
permitted development (or permitted development rights)	Permission to carry out certain limited forms of development without the need to make an application to a local planning authority, as granted under the terms of the Town and Country Planning (General Permitted Development) Order.
retail warehouses	Large, usually out-of-town or out-of-centre units selling non-food items such as DIY, furniture, leisure and household goods.
public realm	Those parts of a village, town or city (whether publicly or privately owned) available, for everyone to use. This includes streets, squares and parks.
prs task force	The taskforce was headed by Andrew Stanford, now Head of UK Residential and Private Rented Sector Investment - ‎LaSalle Investment Management. Members that took up post in April 2013 were: Julian D’Arcy of Kirkby Capital, a former regional chairman and proprietary partner at Knight Frank, Joanna Embling, a property consultant and chartered surveyor, specialising in urban redevelopment and a former equity partner at Cushman Wakefield and Dominic Martin, senior analyst at EC Harris and a qualified surveyor. Paul Belson joined at a later date. Disbanded in March 2015, it was supplanted by Mark Davis as PRS 'Champion' at the DCLG
off site construction (osc)	Offsite construction generally occurs in a manufacturing plant specifically designed for this type of process. Individual modules or panels of the building are constructed in the factory then transported to the site.
port	A harbour or sheltered piece of water into which boats can enter for repair, to trade or to allow passengers to board and depart.
community right to build order	An Order made by the local planning authority (under the Town and Country Planning Act 1990) that grants planning permission for a site-specific development proposal or classes of development.
mineral consultation area	An area identified in order to ensure consultation between the relevant minerals planning authority, the minerals industry and others before certain non-mineral planning applications made within the area are determined.
housing associations	A common term for the 2000 or so independent, not-for-profit organisations that work with councils to offer flats and houses to local people.
london plan	The Mayor of London is responsible for producing a new planning strategy for the capital. The London Plan is the name given to the Mayor's spatial development strategy.
town centre	Area defined on the local authority’s proposal map, including the primary shopping area and areas predominantly occupied by main town centre uses within or adjacent to the primary shopping area. References to town centres or centres apply to city centres, town centres, district centres and local centres but exclude small parades of shops of purely neighbourhood significance. Unless they are identified as centres in Local Plans, existing out-of-centre developments, comprising or including main town centre uses, do not constitute town centres.
listed building consent	Consent required for the demolition, in whole or in part of a listed building, or for any works of alteration or extension that would affect the character of the building.
lawful development certificate (ldc)	A certificate issued by a local planning authority, on application, stating that an existing (LDC 191) or proposed use (LDC 192), or other forms of development, can be considered as lawful for planning purposes. This is not the same as planning permission but it is proof that your household building work is lawful.
private rented community (prc)	A term coined by JLL in 2016 to refer, in the most part, to 'Build to Rent' (BTR) but can, in some instances encompass the institutional PRS sector, acquisition of house builder stock for investment and standing investment stock.
statement of community involvement/engagement (sci)	Established as part of the Planning and Compulsory Purchase Act 2004 in United Kingdom law, the statements of community involvement are produced by local authorities to explain to the public how they will be involved in the preparation of local development documents.  (Known as  CIS in Wales)
section 73a (s73a)	Section 73A of the Town and Country Planning Act 1990 permits retrospective planning applications to be made for developments which have been carried out without permission, or which have been carried out without complying with some of the planning conditions imposed on a planning permission.
lessee	A person who holds the lease of a property; a tenant.
tranquil areas	Areas sufficiently remote from the visual or audible intrusion of development or traffic to be considered unspoilt by urban influences.
european site	This includes candidate Special Areas of Conservation, Sites of Community Importance, Special Areas of Conservation and Special Protection Areas, and is defined in regulation 8 of the Conservation of Habitats and Species Regulations 2010.
the tenancy deposit scheme  	One of three Government  authorised firms protecting deposits for tenants
instrumentation operated in the national interest	Includes meteorological and climate monitoring installations, satellite and radio communication, defence and national security sites and magnetic calibration facilities operated by or on behalf of the Government, delegated authorities or for defence purposes.
certificate of immunity from listing	Certificate granting immunity from listing or the issuing of a Building Preservation Notice for a period of five years. Only granted when planning permission has been granted or is being sought for a development.
rural exception site	Small sites used for affordable housing in perpetuity where sites would not normally be used for housing. Rural exception sites seek to address the needs of the local community by accommodating households who are either current residents or have an existing family or employment connection. Small numbers of market homes may be allowed at the local authority’s discretion, for example where essential to enable the delivery of affordable units without grant funding.
rent to rent (rtr)	Rent to Rent is where an individual or company rents a property from  landlords where the Landlord receives a fixed guaranteed rent. These can be attractive to landlords who want a hands-off investment Landlords agree to a guaranteed rent while the rent-to-renter looks after the property, does small maintenance jobs and finds and manages tenants.
unregulated collective investment scheme (ucis)	A Ucis fund is an investment vehicle set up for asset classes that are unable to follow the UK's Financial Services Authority's (FSA's) specific rules on matters such as liquidity, leverage or cash reserves.
race relations (amendment) act 2000	Legislation seeking to prevent discrimination directly or indirectly in any functions carried out by public authorities.
poor-doors	A pejorative term to describe the practice, particularly in tower developments, of segregating access points so that the affordable housing occupants are kept separate from the common areas of the privately owned units. 
townscape / cityscape	The general appearance of a built-up area, for example a street a town or city.
combined heat and power (chp)	The combined production of heat, usually in the form of steam, and power, usually in the form of electricity.
major hazards	Major hazard installations and pipelines, licensed explosive sites and nuclear installations, around which Health and Safety Executive (and Office for Nuclear Regulation) consultation distances to mitigate the consequences to public safety of major accidents may apply.
right to rent (rtr)	The Immigration Act 2014 introduced the concept of 'right to rent' to the private rented sector. Originally introduced in the West Midlands, right to rent requires landlords and agents check the immigration status of their prospective occupiers at the outset of the tenancy. Failure to do so could result in fines for landlords and letting agents as of February 1st 2016 across England. From December 1st 2016, the government has introduced additional penalties and offences relating to right to rent. Landlords now face potential imprisonment for failure to check the occupier's right to rent status
fascia	Part of the face or elevation of a building, where the shop or occupier's name is usually displayed.
waste collection authority (wca)	A local authority that has a duty to collect household waste. They also have a duty to collect commercial waste if requested to do so and may also collect industrial waste. (The waste collection authority may differ from the waste disposal authority).
passive solar heating	A solar heating system using a simple solar collector, building materials, or an architectural design to capture and store the sun's heat. Very simple examples include a garden greenhouse, or a south-facing window in a dwelling.
special purpose vehicle (spv)	Also known as Special Purpose Entities (SPE's) SPVs/SPEs may be formed through limited partnerships, trusts, corporations, limited liability corporations or other entities. An SPV/SPE may be designed for independent ownership, management and funding of a company; as protection of a project from operational or insolvency issues; or for creating a synthetic lease that is expensed on the company’s income statement rather than recorded as a liability on the balance sheet. They help companies securitize assets, create joint ventures, isolate corporate assets or perform other financial transactions
housing land availability (hla)	The total amount of land reserved for residential use awaiting development.
gross return	Gross rate of return is the total rate of return on an investment before the deduction of any fees or expenses. The gross rate of return is quoted over a specific period of time, such as a month, quarter or year.
people with disabilities	People have a disability if they have a physical or mental impairment, and that impairment has a substantial and long-term adverse effect on their ability to carry out normal day-to-day activities. These persons include, but are not limited to, people with ambulatory difficulties, blindness, learning difficulties, autism and mental health needs.
local plan	The plan for the future development of the local area, drawn up by the local planning authority in consultation with the community. In law this is described as the development plan documents adopted under the Planning and Compulsory Purchase Act 2004. Current core strategies or other planning policies, which under the regulations would be considered to be development plan documents, form part of the Local Plan. The term includes old policies which have been saved under the 2004 Act.
schedule of condition	A schedule of condition (SOC) is a factual record of the condition of a property, normally prepared for legal or contractual reasons. Schedules of condition can be prepared for either residential or commercial buildings. They create a complete record of the condition of the property on a particular date that can be used as a benchmark against which its condition can be assessed in the future and any changes identified.
tree preservation order (tpo)	A mechanism for securing the preservation of single or groups of trees of acknowledged amenity value. A tree subject to a  tree preservation order may not normally be topped, lopped or felled without the consent of the local planning authority.
photovoltaics / photovoltaic cells	Conversion of solar radiation (the sun's rays) to electricity by the effect of photons (tiny packets of light) on the electrons in a solar cell. For example, a solar-powered car or a calculator.
appeal	The process whereby a planning applicant can challenge an adverse decision, including a refusal of permission. Appeals can also be made against the failure of the planning authority to issue a decision within a given time, against conditions attached to permission, against the issue of an enforcement notice and against refusals of listed building and planning permission for relevant demolition in a conservation area. In England and Wales, appeals are processed by the Planning Inspectorate.
local development framework (ldf)	The Local Development Framework (LDF) is a non-statutory term used to describe a folder of documents, which includes all the local planning authority's local development documents. An LDF is comprised of: • Development Plan Documents (which form part of the statutory development plan). • Supplementary Planning Documents. The local development framework will also comprise of: • The Statement of Community Involvement. • The Local Development Scheme. • The Annual Monitoring Report. • Any Local Development Orders or Simplified Planning Zones that may have been added.
article 4 direction	Direction removing some or all permitted development rights, for example within a conservation area or curtilage of a listed building. Article 4 directions are issued by local planning authorities.
judicial review	A procedure by which the High Court may review the reasonableness of decisions made by local authorities, the first Secretary of State or lower courts, for example a planning decision.
county council	The local authority that is responsible for waste and minerals planning functions in non-unitary, and non-national park, local authority areas. A county council may provide advice and proposals on strategic planning issues to the Regional Planning Body.
low cost home ownership programme	An important mechanism for delivering a variety of government objectives since the 1980s. The programme has consisted of a number of schemes with differing characteristics and objectives, which have evolved over time.
accessibility	The ability of people to move around an area and reach places and facilities, including elderly and disabled people, those with young children and those encumbered with luggage or shopping.
renewable and low carbon energy	Includes energy for heating and cooling as well as generating electricity. Renewable energy covers those energy flows that occur naturally and repeatedly in the environment – from the wind, the fall of water, the movement of the oceans, from the sun and also from biomass and deep geothermal heat. Low carbon technologies are those that can help reduce emissions (compared to conventional use of fossil fuels).
house of multiple occupation (hmo)	A house in multiple occupation is a property rented out by at least 3 people who are not from 1 ‘household’ (eg a family) but share facilities like the bathroom and kitchen. It’s sometimes called a ‘house share’.
recovery	Value can be recovered from waste by recovering materials through recycling, composting or recovery of energy.
agricultural waste	Waste from a farm or market garden, consisting of matter such as manure, slurry and crop residues.
key diagram	The diagrammatic interpretation of the spatial strategy as set out in a local authority's Core Strategy. (As distinct from a Structure Plan Key Diagram prepared to explain its policy content).
gilts	Gilts are bonds that are issued by the British government, and they are generally considered low-risk investments. Gilts are the U.K. equivalent of U.S. Treasury securities, and the name originates from the original certificates, issued by the British government, which had gilded edges. Gilts given an assured, but relatively low rate of return. Over the past 50 years, Gilts have returned (after Inflation) an average of 2.9%
brownfield land and sites	Previously developed land which is or was occupied by a permanent structure, including the curtilage of the developed land and any associated fixed surface infrastructure. Also see 'Previously-Developed Land'.
spatial vision	A brief description of how the area will be changed at the end of a plan period.
discount to vacant possession (dvp)	The valuation of a portfolio of private rented residential properties will be based on capital values, typically at a discount to vacant possession (VP) value if the property is let. The application of a discount to VP value stems from the historic relationship between landlords and tenants where the tenant had much greater security of tenure which made it difficult for landlords to remove them and gain possession of their property.
passenger transport authority	A statutory body (in some parts of the country), responsible for ensuring the area has an effective and integrated public transport system.
open market value	The amount that a property might be expected to realize, usually expressed in monetary terms, when it is offered for sale in an open market, for a reasonable period of time, by a willing seller, in order to enable the property to be brought to the attention of all or most potential and willing buyers and when the transaction is not affected by any special circumstances that might affect the buyer, the seller or the property.
fund (investment)	An investment fund is a supply of capital belonging to numerous investors used to collectively purchase securities while each investor retains ownership and control of his own shares. An investment fund provides a broader selection of investment opportunities, greater management expertise and lower investment fees than investors might be able to obtain on their own. 
structure plan	An old-style development plan, which sets out strategic planning policies and forms the basis for detailed policies in local plans. These plans will continue to operate for a time after the commencement of the new development plan system, due to transitional provisions under planning reform.
british property federation (bpf)	British Property Federation (BPF) is a not-for-profit membership organisation representing companies involved in property ownership and investment. They represent and promote the interests of all those with a stake in real estate in the UK – owners, developers, funders (equity and debt), agents and advisers. They work with government and regulatory bodies to help the real estate industry grow and thrive, to the benefit of our members and the economy as a whole. Because their membership is industry wide, they provide government and regulators with the knowledge they need to make decisions.
saved policies / saved plan	Policies within unitary development plans, local plans and structure plans that are saved for a time period during replacement production of Local Development Documents.
montague review	This report summarises the results of Sir Adrian Montague’s review of the barriers to institutional investment in private rented homes. It examined how best to encourage greater investment in rental properties and explores the factors that might encourage institutions to invest in new homes for rent. The government’s response was included in the housing and planning package announced on 6 September 2012. The Report is generally acknowledged to have created the impetus for Institutional re-engagement with the PRS and subsequent development of Build to Rent.
biodiversity action plan (bap)	A strategy prepared for a local area aimed at conserving and enhancing biological diversity.
non-fossil fuels	Sources of energy not derived from the combustion of fossil fuels. Examples include renewable energy resources such as wind or hydroelectric (water) power.
written representations	A procedure by which representations on planning appeals, development plans and Development Plan Documents can be dealt with without the need for a full public inquiry or informal hearing.
settlement pattern	A settlement pattern describes the way in which hamlets, villages, towns and cities are distributed in space and the relationships between them.
source protection zone	The Environment Agency identifies Source Protection Zones to protect groundwater (especially public water supply) from developments that may damage its quality.
neighbourhood centre	A number of shops serving a local neighbourhood and separate from the district centre. Sometimes referred to as a Local Centre.
department of heath & social security (dhss)	Superseded by the Department of Works and Pensions, the acronym DHSS still persists in the PRS, pejoratively, to identify those looking for accommodation paid by benefit allowances. Private landlords often refuse to house DHSS applicants.
(spg) supplementary planning guidance	Supplementary Planning Guidance may cover a range of issues, both thematic and site specific and provide further detail of policies and proposals in a development plan.
planning obligation	A legally enforceable obligation entered into under section 106 of the Town and Country Planning Act 1990 to mitigate the impacts of a development proposal. Sometimes called "Section 106" agreements.
business planning zone (bpz)	BPZs offer a simplified planning regime whereby specific 'low-impact' development, conforming to a scheme setting out acceptable use classes and general design standards, might not require planning permission.
independent retailer	A non-multiple retailer operating separately and outside of a larger company chain.
market rent	The amount of rent that can be expected for the use of a property, in comparison with similar properties in the same area.
section 21 notice (s21)	A Section 21 notice is the method by which a landlord can take possession of an assured shorthold tenancy or statutory periodic tenancy without providing a reason for wishing to take possession. A section 21 can only be served upon an assured shorthold tenant or statutory periodic tenant. A section 21 notice is invalid if a landlord has not protected the deposit in a recognised tenancy deposit scheme. Bond schemes are not covered by the tenancy deposit laws. The notice cannot be served until after the first four months of the fixed term, and must be served at least two months before the possession date specified on the notice.
local nature partnership	A body, designated by the Secretary of State for Environment, Food and Rural Affairs, established for the purpose of protecting and improving the natural environment in an area and the benefits derived from it.
client money protection (cmp)	The Client Money Protection (CMP) Scheme is a compensation scheme run by Propertymark which provides compensation to landlords, tenants and other clients should an agent misappropriate their rent, deposit or other client funds.
trading	A simple enough term but one that can have distinct financial implications. 'Trading' and 'Investing' are treated differently by HMRC. In PRS terms, trading is the sale of an asset, the original intention of which was to keep as an investment.  CGT terms are more favourable in this respect. 
code for sustainable homes	A new national standard for sustainable design and construction of new homes launched in December 2006.
scheduled ancient monument	Nationally important monuments usually archaeological remains, that enjoy greater protection against inappropriate development through the Ancient Monuments and Archaeological Areas Act 1979.
aggregates	Sand, gravel, crushed rock and other bulk materials used by the construction industry.
factory outlet centre	Groups of shops often specialising in selling seconds and end-of-line goods at discounted prices.
topography	A description (or visual representation on a map) of the shape of the land, for example, contours or changes in the height of land above sea level.
open ended fund	An open-end fund is a type of mutual fund that does not have restrictions on the amount of shares the fund can issue. The majority of mutual funds are open-end, providing investors with a useful and convenient investing vehicle.
pollution	Anything that affects the quality of land, air, water or soils, which might lead to an adverse impact on human health, the natural environment or general amenity. Pollution can arise from a range of emissions, including smoke, fumes, gases, dust, steam, odour, noise and light.
yield	The "yield" of a property tells you how much of an annual return you are likely to get on your investment. It is calculated by expressing a years rental income as a percentage of how much the property originally  cost or, on-going, current income verses current value.
area of outstanding natural beauty (aonb)	An area with statutory national landscape designation, the primary purpose of which is to conserve and enhance natural beauty. Together with National Parks, AONB represent the nation's finest landscapes. AONB are designated by Natural England.
recycling	The reprocessing of waste either into the same product or a different one.
local development documents (ldds)	These include Development Plan Documents (which form part of the statutory development plan) and Supplementary Planning Documents (which do not form part of the statutory development plan). LDDs collectively deliver the spatial planning strategy for the local planning authority's area.
town centre uses	A diverse range of town centre uses including, retail, social, leisure and cultural, housing, employment and other uses.
viability	In terms of retailing, a centre that is capable of commercial success.
land and new homes (lnh)	The term by which departments within estate agencies are known. They see the process from land acquisition through to the sale of the developed product. Often they will offer a development consultancy advising on the type, configuration & specification of the units. 
retail park	A grouping of retail warehouses.
vitality	In terms of retailing, the capacity of a centre to grow or develop its likeliness and level of activity.
strategic employment site	A key employment site in a strategic location capable of accommodating major investment, often of national or regional significance.
transitional arrangements	Generally used to describe arrangements that are put in place to manage the change from one system of regulations or procedures to another. More recently used to describe government regulations outlining the process of preparing development plans begun before, and to be completed after, the Planning and Compulsory Purchase Act 2004. It includes existing "saved" unitary, structure and local plans until new Local Development Documents are adopted.
determination	The process by which a local planning authority reaches a decision on whether a proposed development requires planning permission.
registered social landlord (rsl)	Social housing is let at low rents on a secure basis to those who are most in need or struggling with their housing costs. Normally councils and not-for-profit organisations (such as housing associations) are Registered Social Landlords.
local development order (ldo)	An Order made by a local planning authority (under the Town and Country Planning Act 1990) that grants planning permission for a specific development proposal or classes of development.
net internal area (nia)	The net internal area (NIA) of a building is the usable area measured to the internal finish of the perimeter or party walls, ignoring skirting boards, at each floor level. Net internal area covers all of those areas that can be used for a particular purpose.
submission document	A Development Plan Document submitted to the Secretary of State for independent examination by a government-appointed planning inspector.
generation y	Also known as 'Millennials' the demographic cohort following Generation X. There are no precise dates for when this cohort starts or ends; demographers and researchers typically use the early 1980s as starting birth years and the mid-1990s to early 2000s as ending birth years
exit (strategy)	A determination of the method employed by the investor to realise the capital value of the investment. In PRS terms this could mean, for example, breaking up the investment and selling to individual owner occupiers or disposing of the investment property as a whole to another investor.
out-of-town	A location out of centre that is outside the existing urban area.
master plan	A type of planning brief outlining the preferred usage of land and the overall approach to the layout of a developer. To provide detailed guidance for subsequent planning applications.
travel plan	A long-term management strategy for an organisation or site that seeks to deliver sustainable transport objectives through action and is articulated in a document that is regularly reviewed.
prior approval	A procedure where permission is deemed granted if the local planning authority does not respond to the developer's application within a certain time. Often relating to telecommunication or agricultural developments.
maintenance	See 'Facilities Management'
contaminated land	Land that has been polluted or harmed in some way making it unfit for safe development and usage unless cleaned.
core and feeder public transport network	A network of bus routes serving major destinations/corridors often having standards for frequencies, times of operation, vehicle quality, levels of bus priority and passenger information. Feeder networks link into the core networks.
financial services authority (fsa)	The Financial Services Authority (FSA) was a quasi-judicial body responsible for the regulation of the financial services industry in the United Kingdom between 2001 and 2013. It was founded as the Securities and Investments Board ("SIB") in 1985. Its board was appointed by the Treasury, although it operated independently of government. It was structured as a company limited by guarantee and was funded entirely by fees charged to the financial services industry. Now superseded by the FCA and the PRA.
general use classes order	The ‘Classes’ of potential uses are divided into groups. Each Part is further divided into sub-groups, which each then contains the specific uses the law is actually concerned with. Each Class is used by the Local Planning Authority (LPA) to allow them to create a suitable balance between residential areas and those for business purposes. The aim is to prevent types of business activities taking place which would have a detrimental effect on the local community. Not every use of building is assigned a Class under this legislation. Examples of these include theatres, petrol stations, and nightclubs; these are known as sui generis.
earnings before interest tax and amortisation major repairs included (ebitda mri)	EBITDA is essentially net income with interest, taxes, depreciation and amortization added back to it. EBITDA can be used to analyse and compare profitability between companies and industries because it eliminates the effects of financing and accounting decisions. EBITDA is often used in valuation ratios and compared to enterprise value and revenue.
statement of consultation / statement of compliance	A report or statement issued by local planning authorities explaining how they have complied with their Statement of Community Involvement during consultation on Local Development Documents.
older people	People over retirement age, including the active, newly-retired through to the very frail elderly, whose housing needs can encompass accessible, adaptable general needs housing for those looking to downsize from family housing and the full range of retirement and specialised housing for those with support or care needs.
venn partners	The company responsible for establishing and managing the Government's Debt Guarantee Scheme, including the origination, underwriting and on-going management of the loans, in addition to developing and managing a new government guaranteed bond programme to efficiently fund them.
reference	A recommendation given by a person or organisation regarding the suitability of an accommodation seeker as a future tenant or lodger. 
spatial development	Changes in the distribution of activities in space and the linkages between them in terms of the use and development of land.
stepping stones	Pockets of habitat that, while not necessarily connected, facilitate the movement of species across otherwise inhospitable landscapes.
habitable rooms	There is no single legal definition of "habitable room", as its use and meaning is subject to context. For example, the Building Regulations Approved documents provide 3 separate definitions in different parts: There are also separate definitions in regards to calculation of residential density, and although they share common themes, the definitions vary and you are advised to check with your Local Planning Authority as to how the calculation should be made.
wash-over village	Villages within a designated green belt which are not subject to specific proposals to extend the village boundary for development.
pet friendly communities	Schemes where pets are not just accepted, but actively encouraged. In the US, pet owners are approximately 40% of all rental customers. 
break clause	A break clause gives the Landlord or Tenant an option to give notice (usually 2 months) during the fixed term of the tenancy. Although notice under a break clause can be given at anytime during the fixed term the tenant’s statutory right to remain at the property for a minimum of 6 months means that they are normally put in to give both the Landlord and Tenant some flexibility after the initial 6 months period.
decent home	Communities and Local Government standard which states that a home must be warm, weatherproof and have reasonably modern facilities in order to be classed as 'decent'. The programme is schedule to end in 2010.
mortgagee	The lender in a mortgage, typically a bank, building society, or savings and loan association.
assured tenancy (at)	Tenancies starting between 15 January 1989 and 27 February 1997 may be assured. There is increased protection from eviction with this type of agreement.
priority habitats and species	Priority habitats and species: Species and Habitats of Principle Importance included in the England Biodiversity List published by the Secretary of State under section 41 of the Natural Environment and Rural Communities Act 2006.
residual waste	Waste remaining after materials for re-use, recycling and composting have been removed.
curtilage	The area normally within the boundaries of a property surrounding the main building and used in connection with it.
royal town planning institute (rtpi)	A professional body furthering the art of town and country planning. Members can be accredited the status of MRTPI.
deposit	A security deposit is a sum of money held in trust in the course of a rental agreement to ensure the property owner against default by the tenant and for the cost of repair in relation to any damage explicitly specified in the lease and that did in fact occur.
reclamation (in terms of mineral operations)	Operations designed to return an area to an acceptable environmental state, whether for the resumption of the former land use or for a new use. It includes restoration, aftercare, soil handling, filling and contouring operations.
concierge	A concierge is a virtual, or physical, one-size-fits-all provider of personalized services. In a residential apartment building, they would typically work at a desk or station near the front of the building. Generally, they are the interface between the customer and the property management team. Their primary objective would be to ensure the well being of the customer and deliver on the brand aspiration of the operator or management company
landscaper character	The distinct and recognisable pattern of elements that occur consistently in a particular type of landscape. It reflects particular combinations of geology, landform, soils, vegetation, land use and human settlement.
playing field	The whole of a site which encompasses at least one playing pitch as defined in The Town and Country Planning (Development Management Procedure) (England) Order 2015.
statement of financial position (sofp)	The statement of financial position is another name for the balance sheet. It is one of the main financial statements and it reports an entity's assets, liabilities, and the difference in their totals.
excluded tenancy	A tenant is likely to be an excluded occupier if: they live in your home. you or a member of your family share a kitchen, bathroom or living room with them
operator	The PRS 'operator' is the investor arm responsible for the financial operation of the building and the returns made. This is distinct from the 'manager' whose role is not associated with risk derived from occupancy. 'Managers' report to operators.
duplex	duplex apartment - an apartment having rooms on two floors that are connected by a staircase.
committee	At a planning authority, an appointed body of locally elected councillors that makes decisions on planning matters.
effective floor area (efa)	Effective Floor Area is the usable area of the rooms within a building measured to the internal face of the walls of those rooms
national nature reserves	Areas designated with the aim of securing protection and appropriate management of the most important areas of wildlife habitat, and to provide a resource for scientific research. All National Nature Reserves are Sites of Special Scientific Interest.
greenhouse effect / global warming	The gradual heating of the Earth due to greenhouse gases, leading to climate change and rising sea levels. Renewable energy, energy efficient buildings and sustainable travel are examples of ways to help avert the greenhouse effect.
bund	An artificial mound or embankment used to either screen a site from view, or reduce noise emissions.
conversions	Generally means the physical work necessary to change the use of a building from a particular use, classified in the use classes order, to another use. Can also mean the sub-division of residential properties into self-contained flats or maisonettes.
institutional investor	Institutional investor is a term for entities which pool money to purchase securities, real property, and other investment assets or originate loans. Institutional investors include banks, insurance companies, pensions, hedge funds, REITs, investment advisors, endowments, and mutual funds.
inset map	A development plan map showing a particular area of interest on the wider proposals map at a larger, more readable scale.
climate change adaptation	Adjustments to natural or human systems in response to actual or expected climatic factors or their effects, including from changes in rainfall and rising temperatures, which moderate harm or exploit beneficial opportunities.
fund manager (fm)	A fund manager is responsible for implementing a fund's investing strategy and managing its portfolio trading activities. A fund can be managed by one person, by two people as co-managers, or by a team of three or more people. Fund managers are paid a fee for their work, which is a percentage of the fund's average assets under management (AUM).
periodic tenancy	A tenancy that, in general terms, following the end of a fixed term AST, is a tenancy which runs from month to month, or less commonly from week to week. Some, rarely, run from quarter to quarter or even year to year,
traffic impact assessment (tia)	An assessment of the effects upon the surrounding area by traffic as a result of a development, such as increased traffic flows that may require highway improvements.
design code	A set of illustrated design rules and requirements which instruct and may advise on the physical development of a site or area. The graphic and written components of the code are detailed and precise, and build upon a design vision such as a masterplan or other design and development framework for a site or area.
minerals of local and national importance	Minerals which are necessary to meet society’s needs, including aggregates, brickclay (especially Etruria Marl and fireclay), silica sand (including high grade silica sands), cement raw materials, gypsum, salt, fluorspar, shallow and deep-mined coal, oil and gas (including hydrocarbons), tungsten, kaolin, ball clay, potash and local minerals of importance to heritage assets and local distinctiveness.
national park	The statutory purposes of national parks are to conserve and enhance their natural beauty, wildlife and cultural heritage and to promote opportunities for public understanding and enjoyment of their special qualities. National parks are designated by Natural England, subject to confirmation by the Secretary of State under the National Parks and Access to the Countryside Act 1949.
best value	The way an authority measures, manages and improves its performance with regard to Government targets.
site of special scientific interest (sssi)	A site designated by Natural England under the Wildlife and Countryside Act 1981 as an area of special interest by reason of any of its flora, fauna, geological or physiographical features (plants, animals and natural features relating to the Earth's structure).
return on equity	Return on equity (ROE) is a measure of profitability that calculates how many £'s of profit a company generates with each £ of shareholders' equity. The formula for ROE is: ROE = Net Income/Shareholders' Equity. ROE is sometimes called "return on net worth."
investment return	A profitability measure that evaluates the performance of a business by dividing net profit by net worth . Return on investment, or ROI, is the most common profitability ratio. There are several ways to determine ROI, but the most frequently used method is to divide net profit by total assets.
aftercare (in terms of minerals operations)	The steps to be taken to bring land to the required standard for use for its intended use once mineral working has taken place, and its subsequent maintenance.
social housing provider (shp)	Social housing is let at low rents on a secure basis to those who are most in need or struggling with their housing costs. Normally councils and not-for-profit organisations (such as housing associations) are the ones to provide social housing.
dumbbell	Generally a two bedroom apartment where the bedrooms are of equal size and each with an ensuite bathroom. Originally a term from James Ware's 1900's design in NY. "dumbbell tenements" after the shape of the building footprint: an air shaft gives each tenement the narrow-waisted shape of a dumbbell, wide facing the street and backyard, narrowed in between to create the air corridor. They were built in great numbers to accommodate waves of immigrating Europeans.
local landscape designation (for example, 'area of high landscape value')	Non-statutory and locally designated areas outside the national landscape designations, which are considered by the local planning authority to be of particular landscape value to the local area.
sustainable communities	Places where people want to live and work, now and in the future.
original building	A building as it existed on 1 July 1948 or, if constructed after 1 July 1948, as it was built originally.
inward investment	New business investment or expansion of an existing investment into an area from outside.
net initial yield (niy)	Net initial yield is the annualised rents generated by the portfolio, after the deduction of an estimate of annual recurring irrecoverable property outgoings, expressed as a percentage of the portfolio valuation (adding notional purchaser's costs), excluding development and residential properties.
small to medium enterprise (sme)	An independent business managed by its owner or part owners and having a small market share either by number of employees or turnover.
crushed rock	Hard types of rock, which have been quarried, fragmented and graded for use as aggregate.
eviction	Eviction is the forcible legal removal of a tenant from rental property by the landlord. This is effected by due process. However, not all landlords evict tenants legally. 
unfurnished	A rented property where the tenant provides their own furniture and equipment. 
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documents (key, value) FROM stdin;
environment act 1995 - act chapter 25 1995 - department of the environment	http://www.legislation.gov.uk/ukpga/1995/25/contents
human rights act 1998 - act chapter 42 1998	http://www.legislation.gov.uk/ukpga/1998/42/contents
town and country planning act 1990 - act chapter 8 1990 - department of the environment	http://www.legislation.gov.uk/ukpga/1990/8/contents
environmental protection act 1990 - act chapter 43 1990	http://www.legislation.gov.uk/ukpga/1990/43/contents
local democracy, economic development and construction act 2009 - act chapter 20 2009	http://www.legislation.gov.uk/ukpga/2009/20/contents
planning and compensation act 1991 - act chapter 34 1991	http://www.legislation.gov.uk/ukpga/1991/34/contents
localism act 2011 - act chapter 20 2011	http://www.legislation.gov.uk/ukpga/2011/20/contents
growth and infrastructure act 2013 - act chapter 27 2013	http://www.legislation.gov.uk/ukpga/2013/27/contents
countryside and rights of way act 2000 - act chapter 37 2000 - department of the environment	http://www.legislation.gov.uk/ukpga/2000/37/contents
planning (listed buildings and conservation areas) act 1990 - act chapter 9 1990	http://www.legislation.gov.uk/ukpga/1990/9/contents
london plan 2015	https://www.london.gov.uk/sites/default/files/the_london_plan_2016_jan_2017_fix.pdf
infrastructure act 2015 - act chapter 7 2015	http://www.legislation.gov.uk/ukpga/2015/7/contents
housing act 2004 - act chapter 34 2004, office of the deputy prime minister	http://www.legislation.gov.uk/ukpga/2004/34/contents
national planning policy framework 2012 (nppf)	https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/6077/2116950.pdf
pollution prevention and control act 1999 -act chapter 24 1999 - department of the environment transport and the regions	http://www.legislation.gov.uk/ukpga/1999/24/contents
caravan sites and control of development act 1960 - act chapter 62 1960	http://www.legislation.gov.uk/ukpga/Eliz2/8-9/62/contents
planning (hazardous substances) act 1990 - act chapter 10 1990	http://www.legislation.gov.uk/ukpga/1990/10/contents
housing white paper 2017 - fixing our broken housing system	https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/590463/Fixing_our_broken_housing_market_-_accessible_version.pdf
planning act 2008 - act chapter 29 2008	http://www.legislation.gov.uk/ukpga/2008/29/contents
housing act 1996 - act chapter 52 1996	http://www.legislation.gov.uk/ukpga/1996/52/contents
enterprise and regulatory reform act 2013 - act chapter 24 2013	https://www.legislation.gov.uk/ukpga/2013/24/contents
planning and compulsory purchase act 2004 - act chapter 5 2004	http://www.legislation.gov.uk/ukpga/2004/5/contents
\.


--
-- Data for Name: local_plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY local_plans (key, value) FROM stdin;
wiltshire	http://www.wiltshire.gov.uk/planninganddevelopment/planningpolicy.htm
east staffordshire	http://www.eaststaffsbc.gov.uk/planning/planning-policy/local-plan-2012-2031
suffolk coastal	http://www.eastsuffolk.gov.uk/planning/local-plans/suffolk-coastal-local-plan/
south ayrshire 	http://www.south-ayrshire.gov.uk/planning/documents/core/cd%2055%20south%20ayrshire%20local%20plan%20text.pdf
crawley	http://www.crawley.gov.uk/crawley2030
fareham	http://www.fareham.gov.uk/planning/localplan.aspx
county durham	http://www.durham.gov.uk/cdp
vale of glamorgan	http://www.valeofglamorgan.gov.uk/en/living/planning_and_building_control/planning_policy/local_development_plan/local_development_plan.aspx
tower hamlets	http://www.towerhamlets.gov.uk/Documents/Planning-and-building-control/Strategic-Planning/Local-Plan/Core-Strategy-and-MDD/Core-Strategy-low-resolution.pdf
swale	http://www.swale.gov.uk/planning-policy/
york	https://www.york.gov.uk/info/20051/planning_policy/710/new_local_plan
falkirk	http://www.falkirk.gov.uk/services/planning-building/planning-policy/local-development-plan/
conwy	http://spp.conwy.gov.uk/section.asp?cat=11076&Language=1
leeds	http://www.leeds.gov.uk/council/Pages/Planning-Policy-and-Local-Development-Framework.aspx
merton	http://www.merton.gov.uk/environment/planning/planningpolicy/localplan/core_strategy.htm
wigan	http://www.wigan.gov.uk/Docs/PDF/Council/Strategies-Plans-and-Policies/Planning/Adopted-Core-Strategy.pdf
ealing	https://www.ealing.gov.uk/info/200923/development_core_strategy
stockton-on-tees	https://www.stockton.gov.uk/media/2827/core-strategy-dpd.pdf
torfaen	http://www.torfaen.gov.uk/en/PlanningAndDevelopment/Planningpolicy/LocalDevelopmentPlan/Local-Development-Plan.aspx
maidstone	http://www.maidstone.gov.uk/residents/planning/local-plan
wealden	http://www.wealden.gov.uk/Wealden/Planning_Policy/Local_Plan/CoreStrategy/Planning_Core_Strategy_Local_Plan.aspx
city of london	https://www.cityoflondon.gov.uk/services/environment-and-planning/planning/planning-policy/local-development-framework/Documents/The%20Core%20Strategy%20September%202011.pdf
dumfries and galloway	http://www.dumgal.gov.uk/ldp
south somerset	https://www.southsomerset.gov.uk/media/707200/south_somerset_local_plan_2006-2028_adoption_version_march_2015.pdf
scottish borders 	https://www.scotborders.gov.uk/info/20051/plans_and_guidance/121/local_development_plan
carmarthenshire	http://www.carmarthenshire.gov.wales/home/residents/planning/policies-development-plans/local-development-plan/
breckland	https://www.breckland.gov.uk/planningpolicy
warrington	https://www.warrington.gov.uk/info/200564/planning_policy/1903/local_plan
north devon	http://northdevon.gov.uk/planning-and-building-control/local-plan/
cardiff	https://www.cardiff.gov.uk/ENG/resident/Planning/Local-Development-Plan/Pages/default.aspx
inverclyde 	https://www.inverclyde.gov.uk/planning-and-the-environment/planning-policy/development-planning/ldp
welwyn hatfield	http://www.welhat.gov.uk/localplanbackground
moray	http://www.moray.gov.uk/moray_standard/page_51210.html
south downs national park	https://www.southdowns.gov.uk/planning/planning-policy/current-policy/
south derbyshire	http://www.south-derbys.gov.uk/LDF
luton	http://www.luton.gov.uk/localplan2031
harlow	http://www.harlow.gov.uk/local-plan
pendle	http://www.pendle.gov.uk/corestrategy
elmbridge	http://www.elmbridge.gov.uk/planning/local-plan/
woking	https://www.woking.gov.uk/planning/policy/ldf
bury	http://www.bury.gov.uk/index.aspx?articleid=10735
gloucester city	http://www.gloucester.gov.uk/resident/planning-and-building-control/planning-policy/Pages/current-planning-policy.aspx
worthing	https://www.adur-worthing.gov.uk/worthing-ldf/worthing-core-strategy/
torridge	http://www.torridge.gov.uk/localplan
yorkshire dales national park	http://www.yorkshiredales.org.uk/living-and-working/planning-policy-section
wirral	https://www.wirral.gov.uk/planning-and-building/local-plans-and-planning-policy/local-plans
copeland	http://www.copeland.gov.uk/sites/default/files/attachments/copeland_local_plan_2013_2028.pdf
slough	https://www.slough.gov.uk/downloads/SLDF-Core-Strategy.pdf
new forest	http://www.newforest.gov.uk/localplan2016
watford	https://www.watford.gov.uk/downloads/download/61/adopted_local_plan_core_strategy
gateshead	http://www.gateshead.gov.uk/Building%20and%20Development/PlanningpolicyandLDF/LocalPlan/LocalDevelopmentFrameworks.aspx
thurrock	https://www.thurrock.gov.uk/core-strategy-local-plan/about-core-strategy
north dorset	https://www.dorsetforyou.gov.uk/planning/north-dorset/planning-policy
reading	http://www.reading.gov.uk/media/1046/Core-Strategy-Adopted-January-2008/pdf/Core-Strategy-Adopted-Jan08-Altered-Jan15.pdf
melton	https://www.meltonplan.co.uk/
barking and dagenham	https://www.lbbd.gov.uk/residents/planning-and-building-control/planning-guidance-and-policies/development-plan/core-strategy-dpd-2010/
arun	http://www.arun.gov.uk/emerging-local-plan
south norfolk	https://www.south-norfolk.gov.uk/planning-policy
reigate and banstead	http://www.reigate-banstead.gov.uk/download/downloads/id/1887/reigate_and_banstead_local_plan_core_strategy_adopted_july_2014.pdf
isles of scilly	http://www.scilly.gov.uk/planning-development/planning-policies-and-guidance
east renfrewshire	http://www.eastrenfrewshire.gov.uk/local-development-plan
redbridge	https://www.redbridge.gov.uk/planning-and-building/planning-policy/local-development-framework/
south holland	http://www.sholland.gov.uk/article/3539/Local-Plan
harborough	http://www.harborough.gov.uk/core-strategy
southend-on-sea	http://www.southend.gov.uk/corestrategy
dudley	http://www.dudley.gov.uk/resident/planning/planning-policy/local-plan/
spelthorne	https://www.spelthorne.gov.uk/article/2882/Core-Strategy-and-Policies-DPD
basildon	http://www.basildon.gov.uk/article/2009/Local-Plan-2014---2034
kettering	http://www.kettering.gov.uk/info/494/planning_-_local_plans
cheshire east	http://www.cheshireeast.gov.uk/planning/spatial_planning/cheshire_east_local_plan/cheshire_east_local_plan.aspx
plymouth	http://www.plymouth.gov.uk/homepage/environmentandplanning/planning/planningpolicy/ldf/ldfcorestrategy.htm
brentwood	http://brentwood.moderngov.co.uk/documents/s9105/Appendix%20A%20-%20Provisional%20Draft%20Local%20Plan.pdf
eden	https://www.eden.gov.uk/planning-and-building/planning-policy/eden-local-plan-2014-to-2032/
renfrewshire	http://www.renfrewshire.gov.uk/article/2478/Renfrewshire-Local-Development-Plan
dundee city	http://www.dundeecity.gov.uk/localdevplan
lincoln	https://www.lincoln.gov.uk/your-council/policies-publications-and-information/planning-and-building-policies-and-publications/the-city-of-lincoln-local-plan/
west lancashire	http://www.westlancs.gov.uk/planning/planning-policy/the-local-plan/the-local-plan-2012-2027.aspx
chichester	http://www.chichester.gov.uk/newlocalplan
sefton	https://www.sefton.gov.uk/localplan
bradford	https://www.bradford.gov.uk/browse-all-news/press-releases/local-plan-core-strategy/
broadland	https://www.broadland.gov.uk/downloads/download/159/current_local_plan_-_joint_core_strategy
barrow-in-furness	http://www.barrowbc.gov.uk/residents/planning/planning-policy/local-plan/
blaby	http://www.blaby.gov.uk/about-the-council/strategies-plans-policies/environment-and-planning/local-plan/local-plan-core-strategy/
chelmsford	http://www.chelmsford.gov.uk/sites/default/files/documents/files/Core%20Strategy%20and%20Development%20Control%20Policies%20Development%20Plan%20Document.pdf
cairngorms	http://cairngorms.co.uk/park-authority/planning/local-dev-plan/
north lanarkshire	http://www.northlanarkshire.gov.uk/index.aspx?articleid=16016
bromsgrove	http://www.bromsgrove.gov.uk/council/policy-and-strategy/planning-policies/local-development-plan.aspx
bromley	http://www.bromley.gov.uk/info/1004/planning_policy
bolton	http://www.bolton.gov.uk/website/Pages/Corestrategy.aspx
craven	http://www.cravendc.gov.uk/newlocalplan
sevenoaks	http://www.sevenoaks.gov.uk/services/housing/planning/local-plan-and-planning-policy/core-strategy
greenwich	http://www.royalgreenwich.gov.uk/info/1004/planning_policy/869/local_development_framework/2
east cambridgeshire	https://www.eastcambs.gov.uk/local-development-framework/east-cambridgeshire-local-plan-2015
bedford	https://www.bedford.gov.uk/environment_and_planning/planning_town_and_country/planning_policy__its_purpose/local_plan_2035.aspx
great yarmouth	https://www.great-yarmouth.gov.uk/article/2489/Current-Local-Plan
tunbridge wells	http://www.tunbridgewells.gov.uk/residents/planning/planning-policy/development-plan-documents/core-strategy
knowsley	https://localplanmaps.knowsley.gov.uk/documents/knowsley-local-plan-adopted-core-strategy.pdf
wyre forest	http://www.wyreforestdc.gov.uk/planningpolicy
hyndburn	http://www.hyndburnbc.gov.uk/site/scripts/documents_info.php?documentID=936
richmond upon thames	http://www.richmond.gov.uk/home/services/planning/planning_policy/local_plan/core_strategy.htm
lewisham	http://www.lewisham.gov.uk/myservices/planning/policy/LDF/core-strategy/Pages/default.aspx
north hertfordshire	https://www.north-herts.gov.uk/home/planning/planning-policy/local-plan
waverley	http://www.waverley.gov.uk/downloads/494/local_plan
mole valley	https://www.molevalley.gov.uk/index.cfm?articleid=17327
highland 	http://www.highland.gov.uk/info/178/local_and_statutory_development_plans
exmoor national park	http://www.torbay.gov.uk/media/8170/sd75.pdf
rhondda cynon taff	http://www.rctcbc.gov.uk/EN/Resident/PlanningandBuildingControl/LocalDevelopmentPlans/RelateddocumentsLDP20062021/AdoptedLocalDevelopmentPlan.pdf
trafford	http://www.trafford.gov.uk/planning/strategic-planning/docs/core-strategy-adopted-final.pdf
stoke-on-trent	https://www.stoke.gov.uk/ldf
eastleigh	https://www.eastleigh.gov.uk/localplan
rochford	https://www.rochford.gov.uk/planning-and-building/planning-policy/adopted-plans
norwich	https://www.norwich.gov.uk/info/20199/local_plan
fife council	http://www.fife.gov.uk/localplan
neath port talbot	https://www.npt.gov.uk/PDF/ldp_written_statement_jan16.pdf
south northamptonshire	http://www.southnorthants.gov.uk/1128.htm
test valley	http://www.testvalley.gov.uk/resident/planningandbuildingcontrol/planningpolicy/local-development-framework/dpd/
hart	https://www.hart.gov.uk/local-plan
surrey heath	http://www.surreyheath.gov.uk/residents/planning/planning-policy/surrey-heath-local-plan
north york moors national park	http://www.northyorkmoors.org.uk/planning/framework/Adopted-Core-Strategy-and-Development-Policies.pdf
rushmoor	http://www.rushmoor.gov.uk/corestrategy
forest heath	http://www.westsuffolk.gov.uk/planning/Planning_Policies/local_plans/forest-heath-local-plan.cfm
ashford	http://www.ashford.gov.uk/core-strategy-2008
south tyneside	https://www.southtyneside.gov.uk/article/36015/Local-Development-Framework
north norfolk	https://www.north-norfolk.gov.uk/tasks/planning-policy/view-the-current-local-plan/
lichfield	https://www.lichfielddc.gov.uk/Council/Planning/The-local-plan-and-planning-policy/Local-plan/Local-plan.aspx
camden	http://www.camden.gov.uk/ccm/content/environment/planning-and-built-environment/two/planning-policy/local-plan/local-plan/
st helens	https://www.sthelens.gov.uk/planning-building-control/planning-policy/core-strategy/
rushcliffe	http://www.rushcliffe.gov.uk/planningpolicy/localplan/
harrow	http://www.harrow.gov.uk/info/856/local_plan/596/core_strategy
preston	http://www.preston.gov.uk/yourservices/planning/planning-policy/preston-local-plan/
broxbourne	https://www.broxbourne.gov.uk/resident-planning-and-building-planning-policy/development-plan
southampton	https://www.southampton.gov.uk/policies/Amended-Core-Strategy-inc-CSPR-%20Final-13-03-2015_tcm63-371354.pdf
winchester	http://www.winchester.gov.uk/planning-policy/local-plan-part-1/
south gloucestershire	http://www.southglos.gov.uk/documents/cleanversionforinterimpublication2.pdf
rugby	https://www.rugby.gov.uk/a_to_z/service/34/core_strategy
aberdeenshire	https://www.aberdeenshire.gov.uk/planning/plans-and-policies/aberdeenshire-local-development-plan-2017/
rossendale	http://www.rossendale.gov.uk/info/856/local_development_framework/292/local_plan_part_1_core_strategy_dpd_adopted
rochdale	http://www.rochdale.gov.uk/planning-and-building/local-planning-policy/the-local-plan/core-strategy
hambleton	https://www.hambleton.gov.uk/download/downloads/id/750/core_strategy_local_development_framework_-_development_plan_document.pdf
lake district national park	http://www.copeland.gov.uk/sites/default/files/attachments/copeland_local_plan_2013_2028.pdf
bournemouth	http://www.bournemouth.gov.uk/PlanningBuilding/CoreStrategyDocuments/Core-Strategy-(1).pdf
middlesbrough	https://www.middlesbrough.gov.uk/sites/default/files/PlanPol-Core_Strategy.pdf
north kesteven	https://www.n-kesteven.gov.uk/_resources/assets/attachment/full/0/17709.pdf
wrexham	https://www.wrexham.gov.uk/english/planning_portal/plan_policy/wxm_udp.htm
newport	http://www.newport.gov.uk/documents/Planning-Documents/LDP-2011-2026/LDP-Adopted-Plan-January-2015.pdf
stockport	https://www.stockport.gov.uk/corestrategy
central bedfordshire	http://www.centralbedfordshire.gov.uk/planning/policy/local-plan/overview.aspx
waltham forest	https://www.walthamforest.gov.uk/content/local-plan
westminster	http://transact.westminster.gov.uk/docstores/publications_store/Core_Strategy_Adopted_26_Jan_2011.pdf
ashfield	http://www.ashfield.gov.uk/media/2246/lp1-ashfield_publication_local_plan___2016.pdf
newham	https://www.newham.gov.uk/pages/services/local-plan.aspx
hounslow	http://www.hounslow.gov.uk/core_strategy_jul11.pdf
south kesteven	http://www.southkesteven.gov.uk/index.aspx?articleid=8498
north east derbyshire	http://www.ne-derbyshire.gov.uk/index.php/resident/local-plan?artid=148
hammersmith and fulham	https://www.lbhf.gov.uk/planning/planning-policy/local-development-framework/core-strategy
north lincolnshire	http://www.northlincs.gov.uk/planning-and-environment/planning-policy/local-plan/north-lincolnshire-local-plan/
ceredigion	https://www.ceredigion.gov.uk/ldp
west devon	http://www.westdevon.gov.uk/article/3237/The-Development-Plan
rotherham	http://www.rotherham.gov.uk/downloads/download/57/local_plan_core_strategy_documentation
epping forest	http://www.eppingforestdc.gov.uk/contact-us/consultation/planning-our-future
colchester	http://www.colchester.gov.uk/article/13303/Core-Strategy
windsor and maidenhead	https://www3.rbwm.gov.uk/info/200414/local_development_framework/591/development_plan/2
rutland	http://www.rutland.gov.uk/local_plan/core_strategy_dpd.aspx
sandwell	http://www.sandwell.gov.uk/info/200275/planning_and_buildings/950/planning_policy
hackney	http://www.hackney.gov.uk/core-strategy
vale of white horse	http://www.whitehorsedc.gov.uk/services-and-advice/planning-and-building/planning-policy/new-local-plan-2031-part-1-strategic-sites
castle point	https://www.castlepoint.gov.uk/new-local-plan
east ayrshire council	https://www.east-ayrshire.gov.uk/PlanningAndTheEnvironment/Development-plans/LocalAndStatutoryDevelopmentPlans/East-Ayrshire-Local-Development-Plan-2017.aspx
worcester	http://www.worcester.gov.uk/planning-policy
mendip	http://www.mendip.gov.uk/localplan
northumberland	http://www.northumberland.gov.uk/Planning/Planning-policy/Plan.aspx
hartlepool	https://www.hartlepool.gov.uk/info/20209/local_plan/312/local_plan
kensington and chelsea	https://www.rbkc.gov.uk/planning-and-building-control/planning-policy/local-plan/local-plan
gwynedd	https://www.gwynedd.llyw.cymru/en/Council/Strategies-and-policies/Environment-and-planning/Planning-policy/Joint-Local-Development-Plan/Joint-Local-Development-Plan.aspx
brecon beacons national park authority	http://www.beacons-npa.gov.uk/planning/draft-strategy-and-policy/brecon-beacons-national-park-local-development-plan/
swansea	http://www.swansea.gov.uk/ldp
sheffield	https://www.sheffield.gov.uk/planning-and-city-development/planning-documents/local-plan/core-strategy.html
darlington	http://www.darlington.gov.uk/environment-and-planning/planning/planning-and-environmental-policy/adopted-development-plan/core-strategy/
portsmouth	https://www.portsmouth.gov.uk/ext/development-and-planning/planning/the-local-plan.aspx
bristol	https://www.bristol.gov.uk/planning-and-building-regulations/local-plan
snowdonia national park	http://www.eryri-npa.gov.uk/planning
chorley	http://chorley.gov.uk/Pages/AtoZ/Chorley-Local-Plan-2012-2026.aspx
lancaster	http://www.lancaster.gov.uk/planning/planning-policyf
corby	https://www.corby.gov.uk/home/planning-and-building-control/planning-policy
nottingham	http://www.nottinghamcity.gov.uk/planning-and-building-control/planning-policy/the-local-plan-and-planning-policy/
uttlesford	http://www.uttlesford.gov.uk/localplan/
wycombe	https://www.wycombe.gov.uk/browse/Planning-and-building-control/New-local-plan/New-local-plan.aspx
bassetlaw	https://data.bassetlaw.gov.uk/media/166244/PlanningAMR07.pdf
south ribble	http://www.southribble.gov.uk/sites/default/files/Adopted%20Version%20July%202015.pdf
manchester	http://www.manchester.gov.uk/info/200074/planning/3301/core_strategy
blackburn with darwen	https://www.blackburn.gov.uk/Pages/Planning-policies.aspx
havering	https://www.havering.gov.uk/Documents/Planning/LDF/Core-Strategy-Development-Control.pdf
waveney	http://www.eastsuffolk.gov.uk/planning/local-plans/
east dorset	https://www.dorsetforyou.gov.uk/planning/east-dorset/planning-policy
mid suffolk	http://www.midsuffolk.gov.uk/planning/planning-policy/adopted-documents/mid-suffolk-district-council/mid-suffolk-local-plan/
enfield	https://new.enfield.gov.uk/services/planning/planning-policy/local-plan/
milton keynes	http://www.milton-keynes.gov.uk/planning-and-building/planning-policy/core-strategy-2013
hertsmere	https://www.hertsmere.gov.uk/Planning--Building-Control/Planning-Policy/Local-Plan/Core-Strategy.aspx
loch lomond and the trossachs	http://www.lochlomond-trossachs.org/planning/planning-guidance/local-development-plan/
mid sussex	http://www.midsussex.gov.uk/planning-licensing-building-control/planning-policy/mid-sussex-local-plan/
shepway	http://www.shepway.gov.uk/planning/planning-policy/local-plan
runnymede	https://www.runnymede.gov.uk/planningpolicy
birmingham	https://www.birmingham.gov.uk/corestrategy
tewkesbury	https://www.tewkesbury.gov.uk/tewkesbury-borough-council-plan/
north east lincolnshire	https://www.nelincs.gov.uk/planning-and-development/planning-policy/the-local-plan/the-new-local-plan/
havant	http://www.havant.gov.uk/localplan
gosport	http://www.gosport.gov.uk/localplan2029/
newcastle upon tyne	https://www.newcastle.gov.uk/planning-and-buildings/planning-policy/core-strategy-and-urban-core-plan
thanet	https://www.thanet.gov.uk/your-services/planning-policy/
south cambridgeshire	https://www.scambs.gov.uk/sites/default/files/documents/Adopted%20Core%20Strategy%20DPD.pdf
high peak	http://www.peakdistrict.gov.uk/planning/how-we-work/policies-and-guides/the-local-plan
midlothian	https://www.midlothian.gov.uk/info/205/planning_policy/286/development_plans_and_policies
merthyr tydfil	http://www.merthyr.gov.uk/media/1538/adopted-ldp-mtcbc-may-2011.pdf
hinckley and bosworth	http://www.hinckley-bosworth.gov.uk/localplan2006
tamworth	http://democracy.tamworth.gov.uk/documents/s2270/Council%20for%20Tamworth%20Core%20StrategyLocal%20Plan.pdf
north tyneside	https://www.northtyneside.gov.uk/browse.shtml?p_subjectCategory=182
east lindsey	http://www.e-lindsey.gov.uk/localplan/
coventry	http://www.coventry.gov.uk/planningpolicy
leicester	https://www.leicester.gov.uk/media/179023/core-strategy-adopted-july-2014.pdf
north ayrshire	http://www.north-ayrshire.gov.uk/resident/planning-and-building-standards/local-development-plan.aspx
basingstoke and deane	https://www.basingstoke.gov.uk/planningpolicy
hillingdon	http://www.hillingdon.gov.uk/localplan
wandsworth	http://www.wandsworth.gov.uk/info/1004/planning_policy/1366/local_plan
selby	http://www.selby.gov.uk/adopted-core-strategy
herefordshire	https://www.herefordshire.gov.uk/media/8060294/core_strategy_combined.pdf
derbyshire dales	http://www.derbyshiredales.gov.uk/planning-a-building-control/local-plan-2015-16
sutton	https://www.sutton.gov.uk/info/200464/planning_policy/1344/local_plan
doncaster	http://www.doncaster.gov.uk/ldfcorestrategy
wyre	https://www.wyre.gov.uk/info/200292/adopted_local_plan
erewash	http://www.erewash.gov.uk/planning-building-control/planning-policy/core-strategy.html
burnley	http://www.burnley.gov.uk/residents/planning/planning-policies/burnleys-emerging-local-plan
redcar and cleveland	http://www.redcar-cleveland.gov.uk/localplan/
medway	http://www.medway.gov.uk/planningandbuilding/planningpolicy/localplan-futuremedway.aspx
tandridge	http://www.tandridge.gov.uk/Planning/planningpolicy/currentpolicy/CoreStrategy.htm
northumberland national park	http://www.northumberlandnationalpark.org.uk/about/planning/policy-guidance/local-plan/
new forest national park	http://www.newforestnpa.gov.uk/info/20040/planning_policy/361/local_plan
nuneaton and bedworth	https://www.nuneatonandbedworth.gov.uk/info/21016/consultations/146/borough_plan_information
powys	http://www.powys.gov.uk/en/planning-building-control/local-development-plan/
sedgemoor	http://www.sedgemoor.gov.uk/corestrategy
dartford	http://windmz.dartford.gov.uk/media/Inspector%20Approved%20Core%20Strategy.pdf
blaenau gwent	http://www.blaenau-gwent.gov.uk/resident/planning/local-development-plan/
southwark	http://www.southwark.gov.uk/planning-and-building-control/planning-policy-and-transport-policy/development-plan/local-plan
fylde	http://www.fylde.gov.uk/council/planning-policy--local-plan-/
west oxfordshire	https://www.westoxon.gov.uk/draftlocalplan
oxford	https://www.oxford.gov.uk/info/20067/planning_policy/743/the_local_plan
stratford-on-avon	https://www.stratford.gov.uk/planning/core-strategy.cfm
horsham	https://www.horsham.gov.uk/planningpolicy/planning-policy/core-strategy
stafford	http://www.staffordbc.gov.uk/theplanforstaffordborough
monmouthshire	http://www.monmouthshire.gov.uk/planning-policy/monmouthshire-local-development-plan-2/monmouthshire-local-development-plan
king's lynn and west norfolk	https://www.west-norfolk.gov.uk/info/20091/local_plan
wakefield	http://www.wakefield.gov.uk/Documents/planning/planning-policy/local-plan/core-strategy/core-strategy.pdf
hastings	http://www.hastings.gov.uk/planning/policy/adoptedlocalplan/strategy/
gedling	http://www.gedling.gov.uk/planningbuildingcontrol/planningpolicy/thereplacementlocalplan/
bexley	http://www.bexley.gov.uk/corestrategy
west lindsey	http://www2.west-lindsey.gov.uk/localplan/plan_index.htm
lewes	http://www.lewes.gov.uk/corestrategy/
shetland islands	http://www.shetland.gov.uk/planning/documents/ShetlandLocalDevelopmentPlanAdopted26_09_2014.pdf
newark and sherwood	http://www.newark-sherwooddc.gov.uk/corestrategy/
cheltenham	https://www.cheltenham.gov.uk/info/46/planning_policy
solihull	http://www.solihull.gov.uk/Resident/Planning/appealsenforcement/planmaking/ldf/localplan
kirklees	http://www.kirklees.gov.uk/localplan
east devon	http://eastdevon.gov.uk/planning/planning-policy/local-plan-2013-2031/
weymouth and portland	https://www.dorsetforyou.gov.uk/jointlocalplan/west/weymouth
swindon	http://ww1.swindon.gov.uk/ep/ep-planning/planningpolicy/ep-planning-localdev/Pages/ep-planning-localdev-localplan.aspx
glasgow city	https://www.glasgow.gov.uk/developmentplan
st edmundsbury	http://www.westsuffolk.gov.uk/planning/Planning_Policies/local_plans/stedmundsburylocalplan.cfm
daventry	https://www.daventrydc.gov.uk/living/planning-policy/
flintshire	http://www.flintshire.gov.uk/en/Resident/Planning/Flintshire-Local-Development-Plan.aspx
peterborough	https://www.peterborough.gov.uk/council/planning-and-development/planning-policies/local-development-plan/
east dunbartonshire	https://www.eastdunbarton.gov.uk/residents/planning-and-building-standards/planning-policy/local-development-plan
orkney islands	http://www.orkney.gov.uk/Service-Directory/O/Orkney-Local-Development-Plan.htm
argyll and bute	https://www.argyll-bute.gov.uk/ldp
west lothian 	http://www.westlothian.gov.uk/WLLP
peak district national park	http://www.peakdistrict.gov.uk/planning/how-we-work/policies-and-guides/core-strategy
bath and north east somerset	http://bathnes.gov.uk/services/planning-and-building-control/planning-policy/core-strategy
braintree	https://www.braintree.gov.uk/info/200230/planning_policy/250/core_strategy_and_proposals_map
croydon	https://www.croydon.gov.uk/planningandregeneration/framework/localplan
fenland	http://www.fenland.gov.uk/core-strategy
comhairle nan eilean siar	http://www.cne-siar.gov.uk/planningservice/localdevplan.asp
isle of anglesey	http://www.anglesey.gov.uk/planning-and-waste/planning-policy/current-plans-and-policies/
east riding of yorkshire	http://www2.eastriding.gov.uk/environment/planning-and-building-control/east-riding-local-plan/strategy-document/
wychavon	hhttps://www.wychavon.gov.uk/local-plan
south bucks	http://www.southbucks.gov.uk/CoreStrategy
purbeck	https://www.dorsetforyou.gov.uk/local-plan/part-1/purbeck
cambridge	https://www.cambridge.gov.uk/planning-policy
ipswich	https://www.ipswich.gov.uk/sites/default/files/Core_Strategy_Dec_11.pdf
rothe	http://www.rother.gov.uk/corestrategy
amber valley	http://www.ambervalley.gov.uk/localplan2016
hull	http://hullcc-consult.limehouse.co.uk/portal/localplan/lppub
calderdale	https://www.calderdale.gov.uk/environment/planning/planning-policy/local-plan/
halton	http://www4.halton.gov.uk/Pages/planning/policyguidance/pdf/CoreStrategy.pdf
gravesham	http://www.gravesham.gov.uk/home/planning-and-building/local-plan/gravesham-local-plan-core-strategy
northampton	http://www.northampton.gov.uk/info/200205/planning-for-the-future/1746/northampton-planning-policy
chiltern	http://www.chiltern.gov.uk/corestrategy/
aylesbury vale	https://www.aylesburyvaledc.gov.uk/sites/default/files/page_downloads/2014%20%28December%29%20LDS%20Final.pdf
east northamptonshire	http://www.east-northamptonshire.gov.uk/info/200193/adopted_local_plan/65/development_plan_documents
isle of wight	https://www.iwight.com/azservices/documents/1321-Core%20Strategy%20-%20Adopted%20Mar%202012.pdf
bridgend	https://www.bridgend.gov.uk/media/174812/ldp_text.pdf
blackpool	http://democracy.blackpool.gov.uk/documents/s11294/Item%207%20-%20Local%20Plan%20Core%20Strategy.pdf
adur	https://www.adur-worthing.gov.uk/adur-ldf/adur-local-plan/
staffordshire moorlands	https://www.staffsmoorlands.gov.uk/article/774/The-Local-Plan-2016-2031
angus	http://www.angus.gov.uk/info/20307/local_development_plan
mid devon	https://www.middevon.gov.uk/residents/planning-policy/mid-devon-local-plan/
sunderland	http://www.sunderland.gov.uk/index.aspx?articleid=8458
allerdale	http://www.allerdale.gov.uk/planning-and-buildings/planning/planning-policy.aspx
stroud	https://www.stroud.gov.uk/media/1455/stroud-district-local-plan_november-2015_low-res_for-web.pdf
broads national park	http://www.broads-authority.gov.uk/__data/assets/pdf_file/0003/414372/1_Core_Strategy_ldf.pdf
west berkshire	http://www.westberks.gov.uk/localplan
ryedale	https://www.ryedaleplan.org.uk/ryedale-local-plan
guildford	http://www.guildford.gov.uk/newlocalplan/localplan
south lakeland	http://applications.southlakeland.gov.uk/documentbrowser/DocumentBrowserFiles/Local%20Plan/Core%20Strategy/CS01%20Core%20Strategy%20October%202010.pdf
edinburgh	http://www.edinburgh.gov.uk/eclp
torbay	http://www.torbay.gov.uk/newlocalplan
east hertfordshire	https://www.eastherts.gov.uk/planningpolicy
forest of dean	http://www.fdean.gov.uk/residents/planning-building/planning-policy/local-plan-new/
tendring	http://www.tendringdc.gov.uk/planning/local-plans-and-policies/view-our-local-plan
exeter	http://exeter.gov.uk/corestrategy/
brent	https://www.brent.gov.uk/services-for-residents/planning-and-building-control/planning-policy/local-plan/
west somerset	https://www.westsomersetonline.gov.uk/Planning---Building/Planning-Policy/Local-Plan-to-2032
perth and kinross	http://www.pkc.gov.uk/developmentplan
three rivers	http://www.threerivers.gov.uk/egcl-page/core-strategy
richmondshire	http://www.richmondshire.gov.uk/planning/local-plan
christchurch	http://www.bournemouth.gov.uk/PlanningBuilding/CoreStrategyDocuments/Core-Strategy-(1).pdf
liverpool	https://liverpool.gov.uk/council/strategies-plans-and-policies/environment-and-planning/plan-making-in-liverpool/current-local-plan-documents/
barnet	https://www.barnet.gov.uk/citizen-home/planning-conservation-and-building-control/planning-policies-and-further-information/Adopted-Local-Plan---Core-Strategy-DPD.html
islington	https://www.islington.gov.uk/planning/planningpol/local_dev_frame/pol_corestrat
wellingborough	http://wellingborough.gov.uk/info/1004/planning_policy
dartmoor national park	http://www.dartmoor.gov.uk/planning/pl-forwardplanning
north warwickshire	https://www.northwarks.gov.uk/info/20028/forward_planning/1082/local_plan_for_north_warwickshire/2
bolsover	http://www.bolsover.gov.uk/index.php/resident/local-plan
derby	http://www.derby.gov.uk/media/derbycitycouncil/contentassets/documents/policiesandguidance/planning/Full%20doc%20complete%20compressed.pdf
cotswold	http://www.cotswold.gov.uk/residents/planning-building/planning-policy/emerging-local-plan/
caerphilly	http://www.caerphilly.gov.uk/Business/Planning-and-building-control-for-business/Local-Development-Plan.aspx
kingston upon thames	https://www.kingston.gov.uk/info/200207/local_development_framework/275/core_strategy
stevenage	http://www.stevenage.gov.uk/149690/planning-policy/
shropshire	https://www.shropshire.gov.uk/planning-policy/
tameside	http://www.tameside.gov.uk/planning/tamesidelocalplan
pembrokeshire	http://www.pembrokeshire.gov.uk/content.asp?id=11211
south lanarkshire 	http://www.southlanarkshire.gov.uk/info/200145/planning_and_building_standards/39/development_plans
maldon	https://www.maldon.gov.uk/info/20048/planning_policy
stirling 	http://www.stirling.gov.uk/localplan
cannock chase	https://www.cannockchasedc.gov.uk/sites/default/files/12-ldf_core_strategy_and_options.doc.pdf
west dorset	https://www.dorsetforyou.gov.uk/jointlocalplan/west/weymouth
south staffordshire	https://www.sstaffs.gov.uk/planning/south-staffordshire-local-plan.cfm
huntingdonshire	http://www.huntingdonshire.gov.uk/planning/adopted-development-plans/core-strategy/
redditch	http://www.redditchbc.gov.uk/council/policy-and-strategy/planning-policies/borough-of-redditch-local-plan.aspx
pembrokeshire coast national park	http://www.pembrokeshirecoast.org.uk/?PID=178
poole	http://www.poole.gov.uk/planning-and-buildings/planning/ldp/
teignbridge	https://www.teignbridge.gov.uk/planning/local-plans-and-policy/teignbridge-local-plan-2033/
chesterfield	https://www.chesterfield.gov.uk/planning-and-building-control/local-plan-and-strategic-planning.aspx
salford	https://www.salford.gov.uk/localplan
west dunbartonshire 	https://www.west-dunbarton.gov.uk/media/811177/west_dunbartonshire_local_plan_-_web.pdf
carlisle	http://www.carlisle.gov.uk/planning-policy/Adopted-Plans/Carlisle-District-Local-Plan-2015-2030
walsall	http://cms.walsall.gov.uk/index/environment/planning/local_development_framework/ldf_core_strategy.htm
tonbridge and malling	http://www.tmbc.gov.uk/__data/assets/pdf_file/0020/13808/Core_Strategy.pdf
aberdeen city	http://www.aberdeencity.gov.uk/planning_environment/planning/local_development_plan/pla_local_development_plan.asp
east hampshire	http://www.easthants.gov.uk/planning-policy/local-plan
north west leicestershire	http://www.nwleics.gov.uk/pages/publication_local_plan_june_2016
warwick	http://www.warwickdc.gov.uk/info/20410/new_local_plan
oadby and wigston	http://www.oadby-wigston.gov.uk/pages/core_strategy
wolverhampton	http://www.wolverhampton.gov.uk/article/2481/Local-Plan-documents
harrogate	https://www.harrogate.gov.uk/downloads/file/187/core_strategy_-_full_version
epsom and ewell	http://www.epsom-ewell.gov.uk/residents/planning/planning-policy/epsom-and-ewell-local-plan
st albans	https://stalbans.gov.uk/planning/Planningpolicy/local-plan.aspx
brighton & hove	https://www.brighton-hove.gov.uk/content/planning/planning-policy/development-plans
east lothian 	http://www.eastlothian.gov.uk/info/204/local_development_plan/231/statutory_development_plans/3
malvern hills	http://www.malvernhills.gov.uk/saved-local-plan
ribble valley	https://www.ribblevalley.gov.uk/info/200364/planning_policy/432/districtwide_local_plan
eastbourne	http://www.eastbourne.gov.uk/about-the-council/council-policies-plans-and-strategies/planning-policy/development-plan/eastbourne-core-strategy-local-plan/
canterbury	https://www.canterbury.gov.uk/ldf
broxtowe	http://www.broxtowe.gov.uk/index.aspx?articleid=13839
haringey	http://www.minutes.haringey.gov.uk/Published/C00000127/M00002930/AI00011879/CoreStrategyDocumentPDF.pdf
south hams	http://www.southhams.gov.uk/article/3234/The-Development-Plan
dacorum	http://www.dacorum.gov.uk/home/planning-development/planning-strategic-planning/local-planning-framework/core-strategy/core-strategy-adopted-sept-2013
taunton deane	https://www.tauntondeane.gov.uk/planning-policy/emerging-local-plans-and-policy/
babergh	http://www.babergh.gov.uk/assets/Uploads-BDC/Economy/Strategic-Planning-Policy/LDF/CoreStrategy/CS-Final/CoreStrategyAdopted2014.pdf
wokingham	http://www.wokingham.gov.uk/planning/planning-policy/local-plan-and-planning-policies/
cornwall	http://www.cornwall.gov.uk/media/3626635/Local-Plan-Core-Strategy-.pdf
telford and wrekin	http://www.telford.gov.uk/info/20172/planning_policy_and_strategy/1229/telford_and_wrekin_local_plan_2011-2031
barnsley	https://www.barnsley.gov.uk/services/planning-and-buildings/local-planning-and-development/our-current-statutory-development-plan/
north somerset	http://www.n-somerset.gov.uk/my-services/planning-building-control/planningpolicy/
mansfield	http://www.mansfield.gov.uk/localplan
denbighshire	https://www.denbighshire.gov.uk/en/resident/planning-and-building-regulations/local-development-plan-map.aspx
cherwell	http://www.cherwell.gov.uk/index.cfm?articleid=9805
south oxfordshire	http://www.southoxon.gov.uk/services-and-advice/planning-and-building/planning-policy/core-strategy
newcastle-under-lyme	https://www.newcastle-staffs.gov.uk/all-services/planning/planning-policy
bracknell forest	http://www.bracknell-forest.gov.uk/core-strategy-development-plan-document-february-2008.pdf
boston	http://www.boston.gov.uk/index.aspx?articleid=3736
scarborough	https://www.scarborough.gov.uk/home/planning/planning-policy/local-plan/new-local-plan
lambeth	https://www.lambeth.gov.uk/sites/default/files/pl-lambeth-local-plan-2015-web.pdf
cheshire west and chester	http://inside.cheshirewestandchester.gov.uk/policies_plans_and_strategies/planning_policy/local_plan
clackmannanshire	http://www.clacksweb.org.uk/environment/corepathsplan/
charnwood	http://www.charnwood.gov.uk/pages/corestrategydpd
oldham	http://www.oldham.gov.uk/info/200585/local_plan
dover	https://www.dover.gov.uk/Planning/Planning-Policy/Local-Plan/Core-Strategy/Home.aspx
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY projects (key, value) FROM stdin;
change of use	https://www.planningportal.co.uk/info/200130/common_projects/9/change_of_use
conservatories	https://www.planningportal.co.uk/info/200130/common_projects/10/conservatories
electrics	https://www.planningportal.co.uk/info/200130/common_projects/16/electrics
extensions	https://www.planningportal.co.uk/info/200130/common_projects/17/extensions
heat pumps (non-domestic)	https://www.planningportal.co.uk/info/200130/common_projects/28/heat_pumps_non-domestic
financing your project	httpss://www.planningportal.co.uk/info/200130/common_projects/131/financing_your_project
fascias	https://www.planningportal.co.uk/info/200130/common_projects/19/fascias
gate ornaments	https://www.planningportal.co.uk/info/200130/common_projects/26/gate_ornaments
trees and hedges	https://www.planningportal.co.uk/info/200130/common_projects/53/trees_and_hedges
biomass fuelled appliances	https://www.planningportal.co.uk/info/200130/common_projects/6/biomass_fuelled_appliances
working from home	https://www.planningportal.co.uk/info/200130/common_projects/56/working_from_home
doors and windows	https://www.planningportal.co.uk/info/200130/common_projects/14/doors_and_windows
solar panels (non domestic)	https://www.planningportal.co.uk/info/200130/common_projects/52/solar_panels_non_domestic
internal walls	https://www.planningportal.co.uk/info/200130/common_projects/33/internal_walls
garage conversion	https://www.planningportal.co.uk/info/200130/common_projects/25/garage_conversion
fuel tanks	https://www.planningportal.co.uk/info/200130/common_projects/24/fuel_tanks
lighting	https://www.planningportal.co.uk/info/200130/common_projects/35/lighting
hydro electricity	https://www.planningportal.co.uk/info/200130/common_projects/30/hydro_electricity
heat pumps	https://www.planningportal.co.uk/info/200130/common_projects/27/heat_pumps
roof	https://www.planningportal.co.uk/info/200130/common_projects/47/roof
demolition	https://www.planningportal.co.uk/info/200130/common_projects/13/demolition
home energy generation	https://www.planningportal.co.uk/info/200130/common_projects/75/home_energy_generation
porches	https://www.planningportal.co.uk/info/200130/common_projects/46/porches
flue, chimney or soil and vent pipe	https://www.planningportal.co.uk/info/200130/common_projects/22/flue_chimney_or_soil_and_vent_pipe
self build homes	https://www.planningportal.co.uk/info/200130/common_projects/49/self_build_homes
kitchens and bathrooms	https://www.planningportal.co.uk/info/200130/common_projects/34/kitchens_and_bathrooms
external walls	https://www.planningportal.co.uk/info/200130/common_projects/18/external_walls
energy saving	https://www.planningportal.co.uk/info/200130/common_projects/76/energy_saving
flats and maisonettes	https://www.planningportal.co.uk/info/200130/common_projects/21/flats_and_maisonettes
loft conversion	https://www.planningportal.co.uk/info/200130/common_projects/36/loft_conversion
solar panels	https://www.planningportal.co.uk/info/200130/common_projects/51/solar_panels
satellite,tv and radio antenna	https://www.planningportal.co.uk/info/200130/common_projects/48/satellitetv_and_radio_antenna
wind turbines	https://www.planningportal.co.uk/info/200130/common_projects/57/wind_turbines
shops	https://www.planningportal.co.uk/info/200130/common_projects/50/shops
high hedges	https://www.planningportal.co.uk/info/200130/common_projects/29/high_hedges
boilers and heating	https://www.planningportal.co.uk/info/200130/common_projects/7/boilers_and_heating
ceilings and floors	https://www.planningportal.co.uk/info/200130/common_projects/8/ceilings_and_floors
micro-combined heat and power	https://www.planningportal.co.uk/info/200130/common_projects/41/micro-combined_heat_and_power
fences, gates and garden walls	https://www.planningportal.co.uk/info/200130/common_projects/20/fences_gates_and_garden_walls
neighbourhood planning	https://www.planningportal.co.uk/info/200130/common_projects/42/neighbourhood_planning
decking	https://www.planningportal.co.uk/info/200130/common_projects/11/decking
underpinning	https://www.planningportal.co.uk/info/200130/common_projects/54/underpinning
warehouses and industrial buildings	https://www.planningportal.co.uk/info/200130/common_projects/55/warehouses_and_industrial_buildings
patio and driveway	https://www.planningportal.co.uk/info/200130/common_projects/44/patio_and_driveway
insulation	https://www.planningportal.co.uk/info/200130/common_projects/32/insulation
basements	https://www.planningportal.co.uk/info/200130/common_projects/5/basements
paving your front garden	https://www.planningportal.co.uk/info/200130/common_projects/45/paving_your_front_garden
outbuildings	https://www.planningportal.co.uk/info/200130/common_projects/43/outbuildings
adverts and signs	https://www.planningportal.co.uk/info/200130/common_projects/4/adverts_and_signs
decorations	https://www.planningportal.co.uk/info/200130/common_projects/12/decorations
drains and sewers	https://www.planningportal.co.uk/info/200130/common_projects/15/drains_and_sewers
flues for biomass and combined heat and power systems (non-domestic)	https://www.planningportal.co.uk/info/200130/common_projects/23/flues_for_biomass_and_combined_heat_and_power_systems_non-_domestic
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reports (date, location, sector, title, url) FROM stdin;
2017-04	london	residential	Prime Central London Rental Index - Apr 2017	https://kfcontent.blob.core.windows.net/research/160/documents/en/april-2017-4653.pdf
2017-04	london	residential	Prime Rental Markets in the Commuter Belt - Apr 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/prime-rental-markets-in-the-commuter-belt-april-2017.pdf
2017-01	london	residential	Prime Central London Sales Index - Jan 2017	https://kfcontent.blob.core.windows.net/research/156/documents/en/january-2017-4388.pdf
2017-04	london	residential	Prime Central London Sales Index - Apr 2017	https://kfcontent.blob.core.windows.net/research/156/documents/en/april-2017-4655.pdf
2017-04	london	residential	London Rental Markets - Apr 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/prime-london-rental-markets-april-2017.pdf
2017-01	london	residential	Focus on: South Bank - 2016	https://kfcontent.blob.core.windows.net/research/255/documents/en/2017-4353.pdf
2017-01	london	residential	Spotlight: Prime London & Country - 2017	http://pdf.euro.savills.co.uk/uk/residential---other/savills-prime-london-and-country-2017.pdf
2017-01	london	residential	Prime Central London Rental Index - Jan 2017	https://kfcontent.blob.core.windows.net/research/160/documents/en/january-2017-4393.pdf
2017-03	london	residential	London Map - Mar 2017	https://kfcontent.blob.core.windows.net/research/734/documents/en/march-2017-4588.pdf
2017-01	london	residential	Victoria & Westminster Market Insight - 2017	https://kfcontent.blob.core.windows.net/research/1191/documents/en/2017-4328.pdf
2017-01	london	residential	Riverside Market Insight - 2017	https://kfcontent.blob.core.windows.net/research/1231/documents/en/2017-4531.pdf
2017-04	london	residential	Prime London Residential Markets - Apr 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/prime-london-residential-markets-april-2017.pdf
2017-04	london	residential	The London Review - Spring 2017	https://kfcontent.blob.core.windows.net/research/78/documents/en/spring-2017-4544.pdf
2017-01	london	residential	Prime Rental Market - Jan 2017	http://pdf.euro.savills.co.uk/uk/spotlight-on/prime-rental-market-jan-2017.pdf
2017-01	london	residential	Prime London Residential Markets - Jan 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/prime-london-residential-markets-january-2017.pdf
2017-01	london	residential	Queens Park Market Insight - 2017	https://kfcontent.blob.core.windows.net/research/976/documents/en/2017-4341.pdf
2017-01	london	residential	King's Cross Market Insight - 2017	https://kfcontent.blob.core.windows.net/research/1230/documents/en/2017-4530.pdf
2017-01	london	residential	City and Aldgate - 2017	https://kfcontent.blob.core.windows.net/research/1222/documents/en/2017-4496.pdf
2017-01	london	residential	Focus on: Staines-upon-Thames - 2017	https://kfcontent.blob.core.windows.net/research/1223/documents/en/2017-4501.pdf
2017-01	london	residential	Focus on: Hackney and Surrounds - 2017	https://kfcontent.blob.core.windows.net/research/1235/documents/en/2017-4565.pdf
2017-02	london	commercial	Brexit Briefing #2: Central London Office Market - Feb 2017	http://pdf.euro.savills.co.uk/uk/office-reports/brexit-briefing-central-london-offices-february-2017.pdf
2017-03	london	commercial	City Office Market Watch - Mar 2017	http://pdf.euro.savills.co.uk/uk/office-reports/city-office-market-watch-march-2017.pdf
2017-01	london	commercial	Greater London and SE Offices Market Watch - Jan 2017	http://pdf.euro.savills.co.uk/uk/office-reports/greater-london-and-south-east-offices-market-watch-january-2017.pdf
2017-04	london	commercial	West End Office Market Watch - Apr 2017	http://pdf.euro.savills.co.uk/uk/office-reports/west-end-office-market-watch-april-2017.pdf
2017-02	london	commercial	City Office Market Watch - Feb 2017	http://pdf.euro.savills.co.uk/uk/office-reports/city-office-market-watch-february-2017.pdf
2017-04	london	commercial	City Office Market Watch - Apr 2017	http://pdf.euro.savills.co.uk/uk/office-reports/city-office-market-watch-april-2017.pdf
2016-12	london	commercial	London Floor Review - Q4 2016	https://www.geraldeve.com/wp-content/uploads/2017/02/Gerald-Eve-London-Floor-Review-Q4-2016.pdf
2017-03	london	commercial	West End Office Market Watch - Mar 2017	http://pdf.euro.savills.co.uk/uk/office-reports/west-end-office-market-watch-march-2017.pdf
2016-12	london	commercial	SE Offices Investment Bulletin Review - 2016	https://www.geraldeve.com/wp-content/uploads/2017/01/Gerald-Eve_South-East-Offices-Investment-Bulletin_REVIEW-2016.pdf
2017-01	london	commercial	West End Investment Watch - Jan 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/west-end-investment-watch---january-2017.pdf
2017-01	london	commercial	West End Office Market Watch - Jan 2017	http://pdf.euro.savills.co.uk/uk/office-reports/west-end-office-market-watch--january-2017.pdf
2017-01	london	commercial	City Investment Watch - Jan 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/city-investment-watch-january-2017.pdf
2017-01	london	commercial	City Office Market Watch - Jan 2017	http://pdf.euro.savills.co.uk/uk/office-reports/city-office-market-watch---january-2017.pdf
2017-02	london	commercial	West End Office Market Watch - Feb 2017	http://pdf.euro.savills.co.uk/uk/office-reports/west-end-office-market-watch-february-2017.pdf
2017-02	london	commercial	City Investment Watch - Feb 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/city-investment-watch-february-2017.pdf
2017-04	london	commercial	Tech X The City - Apr 2017	http://www.cushmanwakefield.com/~/media/reports/uk/Tech%20X%20the%20City.pdf
2017-04	london	commercial	Central London Quarterly - Q1 2017	https://kfcontent.blob.core.windows.net/research/104/documents/en/q1-2017-4608.pdf
2017-02	london	commercial	West End Investment Watch - Feb 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/west-end-investment-watch-february-2017.pdf
2017-04	london	commercial	West End Investment Watch - Apr 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/west-end-investment-watch-april-2017.pdf
2017-04	london	commercial	City Investment Watch - Apr 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/city-investment-watch-april-2017.pdf
2017-01	london	overview	The London Report - 2017	https://kfcontent.blob.core.windows.net/research/982/documents/en/2017-4366.pdf
2017-04	london	overview	Spotlight: London Development - Apr 2017	http://pdf.euro.savills.co.uk/uk/residential---other/london-dev-2017-singles-v3.pdf
2017-01	london	overview	City and Aldgate Lettings Market Insight - 2017	https://kfcontent.blob.core.windows.net/research/1255/documents/en/2017-4635.pdf
2017-04	london	overview	Central London Marketbeat - Q1 2017	http://www.cushmanwakefield.com/~/media/marketbeat/2017/05/Central-London-Marketbeat-Q1-2017.pdf
2016-12	london	overview	Central London Marketbeat - Q4 2016	http://www.cushmanwakefield.com/~/media/reports/uk/Central%20London%20Marketbeat%20Q4%202016.pdf
2017-01	other cities	residential	Edinburgh City Index - Q1 2017	https://kfcontent.blob.core.windows.net/research/585/documents/en/q1-2017-4590.pdf
2016-12	other cities	residential	Prime Exeter City Index - Q4 2016	https://kfcontent.blob.core.windows.net/research/906/documents/en/q4-2016-4461.pdf
2016-12	other cities	commercial	Edinburgh Regional Office Reports - Q4 2016	http://www.cushmanwakefield.com/~/media/marketbeat/2017/01/Edinburgh-Regional-Office-Reports-Q4-16.pdf
2017-01	other cities	commercial	Spotlight: Birmingham Offices - 2017	http://pdf.euro.savills.co.uk/uk/office-reports/spotlight-birmingham-offices-2017.pdf
2017-04	other cities	commercial	Spotlight: Aberdeen Offices - Apr 2017	http://pdf.euro.savills.co.uk/uk/office-reports/spotlight-aberdeen-offices-spring-2017.pdf
2017-03	other cities	commercial	Oxford Office Market - Mar 2017	http://pdf.euro.savills.co.uk/uk/office-reports/oxford-office-market-watch-march-2017.pdf
2017-01	other cities	commercial	Newcastle North East Property Market Report - 2017	https://kfcontent.blob.core.windows.net/research/1234/documents/en/newcastle-north-east-property-market-report-4563.pdf
2016-12	other cities	commercial	Leeds Regional Office Reports - Q4 2016	http://www.cushmanwakefield.com/~/media/marketbeat/2017/01/Leeds-Regional-Office-Reports-Q4-16.pdf
2016-12	other cities	commercial	Bristol Regional Office Reports - Q4 2016	http://www.cushmanwakefield.com/~/media/marketbeat/2017/01/Bristol-Regional-Office-Reports-Q4-16.pdf
2017-03	other cities	commercial	Manchester Office Market - Mar 2017	http://pdf.euro.savills.co.uk/uk/office-reports/manchester-office-market-report-march-2017.pdf
2017-01	other cities	commercial	Aberdeen Office Market Report - 2017	https://kfcontent.blob.core.windows.net/research/163/documents/en/2017-4522.pdf
2017-01	other cities	commercial	Spotlight: Bristol Offices - Jan 2017	http://pdf.euro.savills.co.uk/uk/office-reports/spotlight-bristol-offices-january-2017.pdf
2017-01	other cities	overview	Spotlight: Glasgow Real Estate - 2017	http://pdf.euro.savills.co.uk/uk/spotlight-on/spotlight-glasgow-real-estate-2017.pdf
2016-12	uk	retail	UK Retail Warehouses - Q4 2016	http://www.cushmanwakefield.com/~/media/marketbeat/2017/02/UK-Retail-Warehouses-Q4-2016.pdf
2017-05	uk	retail	UK Shopping Centre and High Street Spotlight - May 2017	http://pdf.euro.savills.co.uk/uk/commercial-retail-uk/spotlight-uk-shopping-centre-and-high-street-q1-2017.pdf
2016-12	uk	retail	UK High Streets - Q4 2016	http://www.cushmanwakefield.com/~/media/marketbeat/2017/02/UK-Retail-High-Streets-Q4-2016.pdf
2016-12	uk	retail	UK Shopping Centre and High Street Report - Q4 2016	http://pdf.euro.savills.co.uk/uk/commercial-retail-uk/uk-shopping-centre-and-high-street-q4-2016.pdf
2017-04	uk	retail	UK Retail Snapshot - Q1 2017	http://www.cushmanwakefield.com/~/media/marketbeat/2017/05/uk_retail_1q17.pdf
2017-04	uk	retail	Shopping Centre Investment Quarterly - Q1 2017	https://kfcontent.blob.core.windows.net/research/103/documents/en/q1-2017-4549.pdf
2016-12	uk	retail	UK Shopping Centres - Q4 2016	http://www.cushmanwakefield.com/~/media/marketbeat/2017/02/UK-Retail-Shopping-Centres-Q4-2016.pdf
2017-04	uk	retail	Retail Newsletter 2017: Issue 5 - Apr 2017	https://kfcontent.blob.core.windows.net/research/1248/documents/en/issue-5-4612.pdf
2017-01	uk	retail	Retail Revolutions: From Digital to Physical - 2017	http://pdf.euro.savills.co.uk/uk/commercial-retail-uk/spotlight-retail-revolutions---from-digital-to-physical-2017.pdf
2017-02	uk	residential	Housing White Paper: Briefing Note - Feb 2017	http://www.cushmanwakefield.com/~/media/reports/uk/HWP%20Briefing%20Note%20%20Cushman%20%20Wakefield%20pdf.pdf
2017-01	uk	residential	UK Housing Market Update - Jan 2017	http://pdf.euro.savills.co.uk/uk/residential---other/2017january.pdf
2017-03	uk	residential	UK Prime Country House Index - Q1 2017	https://kfcontent.blob.core.windows.net/research/82/documents/en/q1-2017-4582.pdf
2017-04	uk	residential	UK Residential Market Update - Apr 2017	https://kfcontent.blob.core.windows.net/research/100/documents/en/april-2017-4607.pdf
2017-04	uk	residential	UK Housing Market Update - Apr 2017	http://pdf.euro.savills.co.uk/uk/residential---other/uk-housing-market-update-april-2017.pdf
2017-03	uk	residential	UK Housing Market Update - Mar 2017	http://pdf.euro.savills.co.uk/uk/residential---other/uk-housing-market-update-march-2017.pdf
2017-03	uk	residential	Scotland's Residential Property Market - Mar 2017	http://pdf.euro.savills.co.uk/uk/spotlight-on/spotlight-scotland-s-residential-property-market-spring-2017.pdf
2017-02	uk	residential	Residential Property Focus: 2017 Issue 1	http://pdf.euro.savills.co.uk/uk/residential-property-focus-uk/residential-property-focus-issue-1-2017.pdf
2017-04	uk	residential	House Price Sentiment Index - Apr 2017	https://kfcontent.blob.core.windows.net/research/350/documents/en/april-2017-4598.pdf
2017-04	uk	residential	Market in Minutes: Prime Country Residential Markets - Apr 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/prime-country-residential-markets-april-2017.pdf
2017-03	uk	residential	Policy Response: Housing White Paper - Mar 2017	http://pdf.euro.savills.co.uk/uk/residential---other/housing-white-paper.pdf
2017-03	uk	residential	Prime Scottish Index - Q1 2017	https://kfcontent.blob.core.windows.net/research/396/documents/en/q1-2017-4575.pdf
2017-02	uk	residential	UK Student Property Report - 2017	https://kfcontent.blob.core.windows.net/research/169/documents/en/2017-4489.pdf
2017-01	uk	residential	UK Residential Development Land - Jan 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/uk-residential-development-land---jan-2017.pdf
2017-01	uk	residential	UK Residential Market Update - Jan 2017	https://kfcontent.blob.core.windows.net/research/100/documents/en/january-2017-4350.pdf
2017-01	uk	residential	Prime Country Residential Markets - Jan 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/prime-country-residential-markets-jan-2017.pdf
2017-04	uk	residential	UK Residential Investment Yield Guide - Apr 2017	https://kfcontent.blob.core.windows.net/research/588/documents/en/april-2017-4587.pdf
2017-02	uk	residential	UK Housing Market Update - Feb 2017	http://pdf.euro.savills.co.uk/uk/uk-housing-market-update-february-2017-1.pdf
2017-04	uk	residential	Brownfield Registers Briefing Note - Apr 2017	http://www.cushmanwakefield.com/~/media/reports/uk/Brownfield%20Registers%20Briefing%20Note%20%20Cushman%20%20Wakefield.pdf
2017-02	uk	residential	Residential Yield Guide - Q1 2017	https://kfcontent.blob.core.windows.net/research/588/documents/en/january-2017-4348.pdf
2017-03	uk	residential	UK Home Counties Rental Index - Q1 2017	https://kfcontent.blob.core.windows.net/research/586/documents/en/q1-2017-4600.pdf
2017-05	uk	residential	UK Residential Development Land – May 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/mim-uk-residential-development-land-may-17.pdf
2017-04	uk	commercial	M25 Quarterly - Q1 2017	https://kfcontent.blob.core.windows.net/research/63/documents/en/q1-2017-4591.pdf
2017-03	uk	commercial	Market in Minutes: UK Commercial – Mar 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/uk-commercial-market-in-minutes-march-2017.pdf
2017-04	uk	commercial	Market in Minutes: UK Commercial – Apr 2017	http://pdf.euro.savills.co.uk/european/market-in-minutes-uk-commercial-april-2017.pdf
2017-01	uk	commercial	UK Office Snapshot - Q1 2017	http://www.cushmanwakefield.com/~/media/marketbeat/2017/05/uk_off_1q17.pdf
2017-04	uk	commercial	Portfolio Investment Market - Spring 2017	https://www.geraldeve.com/wp-content/uploads/2017/03/Gerald-Eve_Portfolio-Investment-Market_SPRING-2017.pdf
2017-03	uk	commercial	Regional Office Market Review & Outlook - Mar 2017	http://pdf.euro.savills.co.uk/uk/office-reports/regional-office-market-review-and-outlook-spring-2017.pdf
2016-12	uk	commercial	UK Regional Offices - Q4 2016	http://www.cushmanwakefield.com/~/media/reports/uk/Regional%20Offices%20Q4%202016.pdf
2017-02	uk	commercial	Market in Minutes: UK Commercial – Feb 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/uk-commercial-market-in-minutes-february-2017.pdf
2017-02	uk	commercial	Scottish Office Market Watch - Feb 2017	http://pdf.euro.savills.co.uk/uk/office-reports/scottish-office-market-watch-feb-2017.pdf
2017-01	uk	commercial	UK Regional Cities Office Market Report - 2017	https://kfcontent.blob.core.windows.net/research/1221/documents/en/2017-4472.pdf
2017-04	uk	other	Spotlight: Foodstores - Apr 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/foodstore-spotlight-2017.pdf
2016-12	uk	other	Prime Logistics Bulletin - Q4 2016	https://www.geraldeve.com/wp-content/uploads/2017/01/Gerald-Eve-Prime-Logistics-Bulletin-Q4-2016.pdf
2017-02	uk	other	Agricultural Rent Survey Year to 31 October 2016 - Feb 2017	http://pdf.euro.savills.co.uk/uk/rural---other/market-in-minutes-agricultural-rent-survey-feb-2017.pdf
2017-04	uk	other	UK Cinema Market Briefing - Apr 2017	http://www.cushmanwakefield.com/~/media/reports/uk/Cinema%20Report%20Final%20-%20April%202017.pdf
2017-01	uk	other	UK Industrial Snapshot - Q1 2017	http://www.cushmanwakefield.com/~/media/marketbeat/2017/05/uk_ind_1q17.pdf
2017-01	uk	other	UK Healthcare Development Opportunities - 2017	https://kfcontent.blob.core.windows.net/research/336/documents/en/2017-4360.pdf
2017-04	uk	other	Spotlight: UK Forestry Market - Mar 2017	http://pdf.euro.savills.co.uk/uk/residential-property-focus-uk/spotlight-uk-forestry-market-2017.pdf
2017-01	uk	other	Manufacturing Risk Index - 2017	http://www.cushmanwakefield.co.uk/en-gb/research-and-insight/2017/manufacturing-risk-index-2017/
2017-01	uk	other	English Farmland Index - Q1 2017	https://kfcontent.blob.core.windows.net/research/157/documents/en/q1-2017-4640.pdf
2017-05	uk	other	Prime Logistics - Q1 2017	https://www.geraldeve.com/wp-content/uploads/2017/05/GE_PLB_Q12017.pdf
2017-01	uk	other	Agricultural Land Market Survey - 2017	http://pdf.euro.savills.co.uk/uk/rural---other/agricultural-land-market-survey-2017.pdf
2016-12	uk	other	Survey 2016: Scottish Estate Benchmarking	http://pdf.euro.savills.co.uk/uk/rural---other/scottish-estate-benchmarking-survey-2016.pdf
2017-01	uk	other	Market in Minutes: Farmland market - Q1 2017	http://pdf.euro.savills.co.uk/uk/market-in-minute-reports/mim-farmland-q1-2017.pdf
2017-04	uk	other	Spotlight: UK Commercial Leisure - Apr 2017	http://pdf.euro.savills.co.uk/uk/commercial---other/spotlight-uk-commercial-leisure-q1-2017.pdf
2017-03	uk	overview	Business Rates Update - Mar 2017	https://www.geraldeve.com/wp-content/uploads/2017/03/Gerald-Eve_BUDGET-MARCH-2017.pdf
2017-02	uk	overview	EveBrief Volume 39(01) - Feb 2017	https://www.geraldeve.com/wp-content/uploads/2017/02/Evebrief-V3901_06FEB-2017.pdf
2017-04	uk	overview	Investment Yield Guide - Apr 2017	https://kfcontent.blob.core.windows.net/research/522/documents/en/april-2017-4589.pdf
2017-03	uk	overview	EveBrief Volume 39(02) - Mar 2017	https://www.geraldeve.com/wp-content/uploads/2017/03/Evebrief-V3902_20MAR-2017_1.pdf
2017-04	uk	overview	Proponomics - Macro - Soft Brexit On The Horizon - Apr 2017	https://kfcontent.blob.core.windows.net/research/1028/documents/en/soft-brexit-on-the-horizon-4611.pdf
2017-05	uk	overview	Specialist Property Report - 2017	https://kfcontent.blob.core.windows.net/research/793/documents/en/2017-rest-assured-4609.pdf
2017-04	uk	overview	InvBrief - Spring 2017	https://www.geraldeve.com/wp-content/uploads/2017/03/Gerald-Eve-Invbrief_Spring-2017.pdf
2017-02	uk	overview	Brexit Deal Tracker - Feb 2017	http://www.cushmanwakefield.com/~/media/reports/uk/Brexit-Deal-Tracker-February-2017.pdf
2017-04	uk	overview	Secondary Investment Yield Guide and Research Report - Apr 2017	https://kfcontent.blob.core.windows.net/research/394/documents/en/april-2017-4605.pdf
\.


--
-- Data for Name: responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY responses (context, response, quickreplies) FROM stdin;
GET_STARTED_PAYLOAD	Hello! What can I help you with? Select an option from the menu to get started.	\N
DEFINE_PAYLOAD	Ok, enter a term you'd like me to define.	Cancel
PD_PAYLOAD	Enter a project you'd like information on. I can find information about most common household tasks, like extensions and paving.	Cancel
DOC_PAYLOAD	Ok, enter a document, such as policy or legislation, that you'd like me to find for you.	Cancel
LP_PAYLOAD	Enter a local planning authority or postcode.	Cancel
REPORT_PAYLOAD_SECTOR	Select a sector:	\N
Cancel	Ok, you can select another topic from the menu to continue.	\N
Success	Hope I could help! Anything else? Ask for another or use the menu for a different topic.	\N
Thanks, bye!	No problem! See you again soon.	\N
Options	No match found! Did you mean:	\N
CONTACT_PAYLOAD	You can find more information and contact my makers on my website! You can also leave feedback on my Facebook page.	\N
NO_PAYLOAD	Sorry, I didn't understand that! Use the menu and quickreplies where possible.	\N
USE_PAYLOAD	Enter a use class you'd like more information on.	List all/Cancel
Failure	Sorry, I couldn't find any matches for that!	Try again
REPORT_PAYLOAD	Choose from the locations below:	London/Other cities/UK/Cancel
\.


--
-- Data for Name: use_classes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY use_classes (key, value) FROM stdin;
a5 hot food takeaways	For the sale of hot food for consumption off the premises.
b8 storage or distribution	This class includes open air storage.
a1 shops	Shops, retail warehouses, hairdressers, undertakers, travel and ticket agencies, post offices, pet shops, sandwich bars, showrooms, domestic hire shops, dry cleaners, funeral directors and internet cafes.
b1 business	Offices (other than those that fall within A2), research and development of products and processes, light industry appropriate in a residential area.
sui generis	Certain uses do not fall within any use class and are considered 'sui generis'. Such uses include: betting offices/shops, pay day loan shops, theatres, larger houses in multiple occupation, hostels providing no significant element of care, scrap yards. Petrol filling stations and shops selling and/or displaying motor vehicles. Retail warehouse clubs, nightclubs, launderettes, taxi businesses, amusement centres and casinos.
a4 drinking establishments	Public houses, wine bars or other drinking establishments (but not night clubs).
c3 dwellinghouses	This class is formed of 3 parts:\n\nC3(a): use by a single person or a family. an employer and certain domestic employees, a carer and the person receiving the care and a foster parent and foster child.\n\nC3(b): up to six people living together as a single household and receiving care, e.g. supported housing schemes such as those for people with learning disabilities or mental health problems.\n\nC3(c): groups of people (up to six) living together as a single household. This allows for those groupings that do not fall within the C4 HMO definition, but which fell within the previous C3 use class, to be provided for.
c4 houses in multiple occupation	Small shared houses occupied by between three and six unrelated individuals, as their only or main residence, who share basic amenities such as a kitchen or bathroom.
d1 non-residential institutions	Clinics, health centres, crèches, day nurseries, day centres, schools, art galleries (other than for sale or hire), museums, libraries, halls, places of worship, church halls, law court. Non residential education and training centres.
b2 general industrial	Use for industrial process other than one falling within class B1 (excluding incineration purposes, chemical treatment or landfill or hazardous waste).
c1 hotels	Hotels, boarding and guest houses where no significant element of care is provided (excludes hostels).
c2a secure residential institution	Use for a provision of secure residential accommodation, including use as a prison, young offenders institution, detention centre, secure training centre, custody centre, short term holding centre, secure hospital, secure local authority accommodation or use as a military barracks.
d2 assembly and leisure	Cinemas, music and concert halls, bingo and dance halls (but not night clubs), swimming baths, skating rinks, gymnasiums or area for indoor or outdoor sports and recreations (except for motor sports, or where firearms are used).
c2 residential institutions	Residential care homes, hospitals, nursing homes, boarding schools, residential colleges and training centres.
a2 financial and professional services	Financial services such as banks and building societies, professional services (other than health and medical services) and including estate and employment agencies. It does not include betting offices or pay day loan shops - these are now classed as “sui generis” uses.
a3 restaurants and cafés	For the sale of food and drink for consumption on the premisesrestaurants, snack bars and cafes.
\.


--
-- PostgreSQL database dump complete
--

