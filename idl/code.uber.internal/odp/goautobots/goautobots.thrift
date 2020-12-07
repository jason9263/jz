namespace java com.uber.odp.goautobots

typedef string UUID
typedef i64 (js.type = "Date") DateTime

/** Exception */
exception EntityNotExistsError
{
    1: required string message
}

exception EntityExistedError
{
    1: required string message
}

exception BadRequestError
{
    1: required string message
}

exception InternalServerError
{
    1: required string message
}

exception WriteConflictError
{
    1: required string message
}

/* plase use new exceptions below*/

exception WorkflowEntityError
{
    1: required string message
    2: required EntityErrorType subType
    3: optional UUID workflowUUID
    4: optional string workflowName
}

exception NodeEntityError
{
    1: required string message
    2: required EntityErrorType subType
    3: required UUID workflowUUID
    4: optional UUID nodeUUID
    5: optional string nodeName
}

exception EdgeEntityError
{
    1: required string message
    2: required EntityErrorType subType
    3: required UUID workflowUUID
    4: optional UUID edgeUUID
    5: optional string edgeName
    6: optional i32 conditionTemplateID
    7: optional string conditionName
}

exception WorkflowValidationError
{
    1: required string message
    2: required WorkflowValidationErrorType subType
    3: required UUID workflowUUID
    4: optional UUID nodeUUID
    5: optional UUID edgeUUID
    6: optional i32 conditionTemplateID
    7: optional list<i32> conditionTemplateIDs
}

exception NodeValidationError
{
    1: required string message
    2: required NodeValidationErrorType subType
    3: required UUID workflowUUID
    4: required UUID nodeUUID
    5: optional string nodeName
    6: optional list<UUID> nodeUUIDs
    7: optional list<string> nodeNames
}

exception EdgeValidationError
{
    1: required string message
    2: required EdgeValidationErrorType subType
    3: required UUID workflowUUID
    4: optional UUID edgeUUID
    5: optional string edgeName
}

exception ConditionValidationError
{
    1: required string message
    2: required ConditionValidationErrorType subType
    3: optional i32 conditionTemplateID
    4: optional string conditionName
    5: optional string detail
}

exception TranslationError
{
    1: required string message
    2: required TranslationErrorType subType
    3: required string detail
}

exception AutobotsInternalError
{
    1: required string message
    2: required AutobotsInternalErrorType subType
    3: required string detail
}

exception ExternalDependencyError
{
    1: required string message
    2: required ExternalDependencyErrorType subType
    3: required string detail
}

exception BadGatewayCallError
{
    1: required string message
    2: optional list<string> errors
}

enum EntityErrorType {
    UNKNOWN = 0,
    NOT_EXIST,
    EXISTED,
}

/* TODO: migrate edge errors to EdgeValidation Error*/
enum WorkflowValidationErrorType {
    UNKNOWN = 0,
    INFINITE_LOOP, /* loop without any event condition or enough wait time */
    EMPTY_LOOP, /* loop without any action or exit edge */
    EDGE_NO_CONDITION, /* edge has no condition */
    EDGE_SAME_PRIORITY, /* two edges have the same priority */
    EDGE_UNKNOWN_CONDITION, /* edge has an unknown condition */
    EDGE_OUTBOUND_LIMIT, /* an outbound edge should contain only one event or timer condition */
    EDGE_OUTBOUND_TYPE, /* All outbound edges from a single node must have the same condition type */
    PRECONDITION_SCOPE, /* Need to fulfill Precondition Scoping Request */
    WORKFLOW_ACTION /* Workflow must have actions */
}

enum NodeValidationErrorType {
    UNKNOWN = 0,
    MULTI_ROOT_NODE /* Only one root node for one campaign (disconnected roots) */
}

enum EdgeValidationErrorType {
    UNKNOWN = 0,
}

enum ConditionValidationErrorType {
    UNKNOWN = 0,
    REQUIRED_SUB_NOT_FULFILLED,
    INVALID_VALUE,
    INVALID_GEOFENCE_UUID,
}

enum TranslationErrorType {
    UNKNOWN = 0,
    WORKFLOW,
    NODE,
    ACTION,
    CONDITION,
}

enum AutobotsInternalErrorType {
    UNKNOWN = 0,
    DATABASE, /* Acessing DB failed */
}

enum ExternalDependencyErrorType {
    UNKNOWN = 0,
    SERVICE_TIME_OUT, /* calling other services got time out */
}

enum WorkflowStatus {
    INACTIVE,
    ACTIVE,
    TEST,
    SIMULATIONSCHEDULED = 10,
    SIMULATIONACTIVE,
    SIMULATIONINACTIVE
}

enum ConditionAvailability {
    PRIVATE,
    PUBLIC,
    DEPRECATED
}

enum ConditionType {
    UNKNOWN,
    EVENT,
    ATTRIBUTE,
    TIMER
}

enum AudienceType {
    UNKNOWN,
    ANY,
    RIDER,
    DRIVER,
    SIRIUS,
    U4B
}

enum CategoryType {
    UNKNOWN,
    COMMS,
    GENERAL,
    ONLINE,
    PROFILE,
    SIGNUP,
    TRIPEVENT,
    RENTAL,
    RIDERINCENTIVE,
    DRIVERPERKSANDREWARDS,
    RISK,
    COLLECTIONS,
    SIRIUS,
    COMPLIMENTS,
    BLISS,
    FREIGHT,
    DRIVERINCENTIVE,
    RIDERLOYALTY,
    RESTAURANTS,
    LOYALTY,
    DRIVEREARNING,
    FLEET,
    FEEDBACK,
    U4B,
    INSURANCE,
    TRANSIT,
    COMPLIANCE,
    GULSTREAMORDER
}

enum LinkingStatus {
    PENDING,
    ACTIVE,
    REJECTED
}

enum WorkflowType {
    SUPERPAC,
    SIGMA
}

enum EdgeType {
    NOTSET,
    PRECONDITION,
    BETWEENNODES,
    EXIT,
    ENTRY
}

enum FlushingType {
    ALLOW_RE_ENTER,
    DISALLOW_RE_ENTER,
}

enum ActionType {
    SEND_SMS,
    SEND_EMAIL,
    ADD_TAG,
    REMOVE_TAG,
    NOTIFICATION,
    VINYLCARD,
    HELIXCARD,
    EXPERIMENT,
    BLOCEMAIL,
    UCONNECT,
    WORKFLOW_EXIT,
    PRODUCT_SHIELD,
    CARBONCARD,
    ADD_NOTE,
    AWARD_PUSH_NOTIFICATION,
    DRIVER_INCENTIVE,
    ADD_TRAIT,
    REMOVE_TRAIT,
    CHANGE_DRIVER_STATUS,
    UPDATE_LEARNING_CONTENT_ENABLED_STATUS,
    UPDATE_RIDER_EDUCATION_EVENT,
    CHANGE_DRIVER_FLOW_TYPE,
    SEND_SURVEY_TO_DRIVER,
    SIRIUS_CONSENSUS,
    BANCO_AWARD,
    APPLY_PROMOTION,
    AWARD_USER_UBER_CREDITS,
    TRIGGER_CONTENT,
    CANCEL_AND_REBOOK_BENEFIT,
    RINGCARD,
    SEND_TEMPLATED_SMS,
    FLEETCARD,
    FREE_DELIVERIES_BENEFIT,
    REWARD_UBER_CASH,
    SEND_BLOC_SMS,
    TRANSITION_PARAMETER_APPLIER,
    ADD_TO_AUDIENCE,
    REMOVE_FROM_AUDIENCE,
    SEND_BLOC_PUSH,
    GRANT_LUNA_POINTS,
    ENROLL_GUARANTEE,
    RINGDELETE,
    LUNA_CAMPAIGN_ACTION,
    BAN_USER,
    # GENERIC_ACTION is a fake action which will be converted to real action
    GENERIC_ACTION,
    RESTAURANTCARD,
    WHATSAPP_DRIVER,
    APPLY_EATS_PROMOTION
}

enum ViewType {
    AUTOBOTS,
    MINISTRY,
    UCM
}

enum UserEntryCountType {
    CURRENT
    LAST_DAY
    SINCE_CREATION
}

enum NodeUserFlowType {
    ENTER
    EXIT
    SMS
    EMAIL
    PUSH
}

struct Action {
    1: optional ActionType actionID
    2: optional string config
}

struct Condition {
    1: optional i32 conditionId
    2: optional string config
}

struct TriggerCondition {
    1: optional i32 type
    2: optional i32 templateID
}

struct Edge {
    1: optional UUID edgeUUID
    2: optional UUID toNodeUUID
    3: optional list<Condition> conditions
    4: optional i32 priority
    5: optional i32 type
    6: optional i32 editCount
}

struct Node {
    1: optional UUID nodeUUID
    2: optional string meta
    3: optional list<Action> actions
    4: optional map<UUID, Edge> outBoundEdges
    5: optional i32 editCount
}

struct ExitEdge {
    1: optional Edge edge
    2: optional list<Action> actions
}

struct FlushingInstance {
    // DEPRECATED Use timestampMillis
    1: optional string timestamp
    2: optional FlushingType type
    3: optional DateTime timestampMillis
}

struct BullseyeIngestion {
    1: required UUID uuid
    2: required UUID toNodeUUID
    3: optional i32 priority
    4: optional map<string, string> meta
    5: required UUID audienceUUID
    6: optional UUID jobID
    7: optional bool allowNewUserEnter
    8: optional bool allowUserExit
}

union Ingestion {
    1: optional BullseyeIngestion bullseyeIngestion
}

// One of these must be provided in all scenarios (copied from floweco.thrift)
union AccessEntity {
    10: optional UUID authorUUID;
    20: optional string ldapGroup;
}

// copied from floweco.thrift
struct AuthorInfo {
    10: required AccessEntity accessEntity;
    20: optional bool isOwner; // front end can assume if it's missing isOwner = false
    30: optional string email; // front end should be getting this from whober in the long term
    40: optional string name; // front end should be getting this from whober in the long term
    50: optional bool isActive;
}

struct Workflow
{
    1: optional UUID workflowUUID
    2: optional WorkflowStatus status
    3: optional WorkflowType type
    4: optional list<Edge> preconditionEdges
    5: optional string name
    6: optional string description
    7: optional i32 priority
    8: optional map<string, string> meta
    9: optional string filters
    10: optional UUID rootUUID
    11: optional map<UUID, Node> nodes
    12: optional string createdByEmail
    13: optional UUID createdByUUID
    // DEPRECATED Use createdAtMillis
    14: optional string createdAt
    // DEPRECATED Use updatedAtMillis
    15: optional string updatedAt
    // DEPRECATED Use deletedAtMillis
    16: optional string deletedAt
    17: optional list<ExitEdge> exitEdges
    18: optional bool allowUserReentry
    19: optional string flushedAt
    20: optional list<FlushingInstance> flushingHistory
    21: optional i32 version
    22: optional DateTime createdAtMillis
    23: optional DateTime updatedAtMillis
    24: optional DateTime deletedAtMillis
    25: optional DateTime flushedAtMillis
    26: required map<UUID, Ingestion> ingestions
    27: optional WorkflowDetails details
    28: optional list<AuthorInfo> authors
    29: optional bool isCritical
}

struct TriggerEvent
{
    1: optional UUID uuid
    2: optional i32 type
    3: optional string topic
}

struct History
{
    1: optional UUID userUUID
    2: optional HistoryWorkflow workflow
    3: optional HistoryNode node
    4: optional HistoryAction action
    5: optional TriggerEvent triggerEvent
    6: optional list<TriggerCondition> triggerConditions
    7: optional string type
    8: optional string time
}

struct HistoryWorkflow
{
    1: optional UUID uuid
    2: optional string name
    3: optional string source
    4: optional string state
    5: optional UUID ownerUUID
}

struct HistoryNode
{
    1: optional UUID actionNode
    2: optional UUID fromNode
    3: optional UUID toNode
}

struct HistoryAction
{
    1: optional string name
    2: optional string status
    3: optional UUID uuid
}

enum ConditionOperator
{
    OP_UNKNOWN
    OP_GT
    OP_GE
    OP_LT
    OP_LE
    OP_EQ
    OP_NE
    OP_IN
    OP_NIN
    OP_ANY
    OP_ALL
    OP_NONE
    OP_NALL
}

enum DataType
{
    UNDEFINED_TYPE
    BOOL_TYPE
    STR_TYPE
    INT_TYPE
    FLOAT_TYPE
    UUID_TYPE
    LIST_STR_TYPE
    LIST_INT_TYPE
    LIST_FLOAT_TYPE
    LIST_UUID_TYPE
    TIME_TYPE
    DURATION_TYPE
    LIST_TIME_TYPE
}

struct SubCondition{
    1: required string name
    2: required string display
    3: required string description
    4: optional string fieldName
    5: required DataType valueType
    6: required list<ConditionOperator> allowedOperators
    7: required list<string> allowedValues
}

struct SLAInfo
{
    1: required double failureRatio
    2: required i32 p95Latency
    3: required i32 throughput
    4: required i32 dataFreshness
}

struct CreateWorkflowRequest
{
    1: optional WorkflowStatus status
    2: optional WorkflowType type
    3: optional string name
    4: optional string description
    5: optional i32 priority
    6: optional string filters
    7: optional string requestingUserEmail
    8: optional UUID requestingUserUUID
}

struct WorkflowMetaRequest {
    1: optional UUID workflowUUID
    2: optional map<string, string> workflowMeta
    3: optional UUID requestingUserUUID
}

struct WorkflowDetails {
    1: required list<i32> cities
    2: required UUID team
    3: required UUID audienceLifecycle
    4: required UUID audienceTopic
    5: required UUID audienceType
    6: required list<UUID> productAreas
}

struct CreateWorkflowDetailsRequest {
    1: required UUID workflowUUID
    2: required WorkflowDetails workflowDetails
    3: optional UUID requestingUserUUID
}

struct WorkflowDetailsPartial {
    1: optional list<i32> cities
    2: optional UUID team
    3: optional UUID audienceLifecycle
    4: optional UUID audienceTopic
    5: optional UUID audienceType
    6: optional list<UUID> productAreas
}

struct UpdateWorkflowDetailsRequest {
    1: required UUID workflowUUID
    2: required WorkflowDetailsPartial workflowDetails
    3: optional UUID requestingUserUUID
}

struct EmptyRequest {
    1: optional UUID requestingUserUUID
    2: optional string requestingUserEmail
}

struct ListWorkflowByStatusRequest {
    1: optional UUID requestingUserUUID
    2: optional WorkflowStatus status
}

struct ListWorkflowMetaRequest {
    1: optional UUID requestingUserUUID
}

struct ListWorkflowByTypeRequest {
    1: optional UUID requestingUserUUID
    2: optional WorkflowType type
}

// DEPRECATED Use SearchWorkflows
struct SearchWorkflowRequest {
    1: optional string text
    2: optional UUID userUUID
}

struct SearchWorkflowsRequest {
    1: optional string text
    2: optional UUID userUUID
}

struct UUIDKeyRequest {
    1: optional UUID uuid
    2: optional UUID requestingUserUUID
    3: optional string requestingUserEmail
    4: optional bool isLiveEdit
}

struct GetWorkflowUpdatedAtResult {
    1: optional string updatedAt
    2: optional DateTime updatedAtMillis
}

struct SetUserReentryRequest {
    1: optional UUID workflowUUID
    2: optional bool AllowUserReentry
    3: optional UUID requestingUserUUID
}

struct SetIsCriticalRequest {
    1: optional UUID workflowUUID
    2: optional bool isCritical
    3: optional UUID requestingUserUUID
}

struct AddNodeToWorkflowRequest {
    1: optional UUID workflowUUID
    2: optional string meta
    3: optional UUID requestingUserUUID
}

struct CleanupWorkflowsRequest {
    1: optional string email
}

struct AddActionToNodeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional Action action
    4: optional UUID requestingUserUUID
}

struct SendActionsToMeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional UUID requestingUserUUID
}

struct AddConditionToEdgeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional UUID toNodeUUID
    4: optional Condition condition
    5: optional UUID requestingUserUUID
}

/*** if edgeUUID is not provided, it will create a newEdge and add to it ***/
struct AddPreConditionsToWorkflowRequest {
    1: optional UUID workflowUUID
    2: optional UUID edgeUUID
    3: optional list<Condition> conditions
    4: optional UUID requestingUserUUID
}

struct AddExitEdgeRequest {
    1: optional UUID workflowUUID
    2: optional UUID edgeUUID
    3: optional list<Condition> conditions
    4: optional list<Action> actions
    5: optional i32 priority
    6: optional UUID requestingUserUUID
}

struct DeleteExitEdgeRequest {
    1: optional UUID workflowUUID
    2: optional UUID edgeUUID
    3: optional UUID requestingUserUUID
}

struct EditActionsForNodeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional list<Action> newActionList
    4: optional UUID requestingUserUUID
    5: optional i32 editCount
    6: optional bool isLiveEdit
}

struct EditConditionsForEdgeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional UUID toNodeUUID
    4: optional list<Condition> newConditionList
    5: optional UUID requestingUserUUID
    6: optional i32 editCount
    7: optional bool isLiveEdit
}

struct CreateIngestionRequest {
    1: required UUID workflowUUID
    2: required Ingestion ingestion
    3: optional UUID requestingUserUUID
}

struct UpdateIngestionRequest {
    1: required UUID workflowUUID
    2: required Ingestion ingestion
    3: optional UUID requestingUserUUID
}

struct DeleteIngestionRequest {
    1: optional UUID workflowUUID
    2: optional UUID ingestionUUID
    3: optional UUID requestingUserUUID
}

struct EditPreConditionsForWorkflowRequest {
    1: optional UUID workflowUUID
    2: optional UUID edgeUUID
    3: optional list<Condition> newPreConditionList
    4: optional UUID requestingUserUUID
    5: optional i32 editCount
    6: optional bool isLiveEdit
}

struct AddEdgeBetweenNodesRequest {
    1: optional UUID workflowUUID
    2: optional UUID fromNodeUUID
    3: optional UUID toNodeUUID
    4: optional UUID requestingUserUUID
}

struct EditMetaForNodeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional string newMeta
    4: optional UUID requestingUserUUID
    5: optional i32 editCount
    6: optional bool isLiveEdit
}


struct  EditPriorityForEdgeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional UUID toNodeUUID
    4: optional i32 priority
    5: optional UUID requestingUserUUID
    6: optional i32 editCount
}

struct EditCreatedByForWorkflowRequest
{
    1: optional UUID workflowUUID
    2: optional string createdByEmail
    3: optional UUID createdByUUID
    4: optional UUID requestingUserUUID
    5: optional string requestingUserEmail
}

struct EditNameForWorkflowRequest
{
    1: optional UUID workflowUUID
    2: optional string name
    3: optional string description
    4: optional UUID requestingUserUUID
    5: optional string requestingUserEmail
}

struct EditTypeForWorkflowRequest
{
    1: optional UUID workflowUUID
    2: optional WorkflowType type
    3: optional UUID requestingUserUUID
    4: optional string requestingUserEmail
}

struct EditStatusForWorkflowRequest
{
    1: optional UUID workflowUUID
    2: optional WorkflowStatus status
    3: optional UUID requestingUserUUID
    4: optional string requestingUserEmail
}

struct DeleteNodeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional UUID requestingUserUUID
    4: optional i32 editCount
}

struct DeleteEdgeRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional UUID toNodeUUID
    4: optional UUID requestingUserUUID
    5: optional i32 editCount
}

struct  ListWorkflowWithExperimentRequest{
}

struct  ListWorkflowWithExperimentResponse{
    1: optional map<UUID, list<string>> experimentKeysByWorkflow
}

struct ListWorkflowResult {
    1: optional map<UUID, Workflow> listResult
}

struct DeleteWorkflowRequest {
    1: optional UUID uuid
    2: optional UUID requestingUserUUID
    3: optional string requestingUserEmail
    4: optional bool hardMode
}

struct GetUserStateRequest {
    1: optional UUID workflowUUID
    2: optional UUID userUUID
}

struct GetUserStateResult {
    1: optional UUID workflowUUID
    2: optional UUID userUUID
    3: optional UUID nodeUUID
    4: optional list<i32> eventTypes
    5: optional list<UUID> eventProcessed
    // DEPRECATED Use movedAtMillis
    6: optional string movedAt
    7: optional DateTime movedAtMillis
}

struct SubscribeUsersForWorkflowsRequest {
    1: optional list<UUID> workflowUUIDs
    2: optional list<UUID> subscriberUUIDs
    3: optional UUID requestingUserUUID
}

struct UnsubscribeUsersForWorkflowsRequest {
    1: optional list<UUID> workflowUUIDs
    2: optional list<UUID> unsubscriberUUIDs
    3: optional UUID requestingUserUUID
}

struct GetSubscriptionsForUserRequest {
    1: optional UUID userUUID
    2: optional UUID requestingUserUUID
}


struct GetSubscriptionsForUserResult {
    1: optional map<UUID, Workflow> subscribedWorkflows
}

struct EnableAnomalyDetectionForWorkflowRequest {
    1: optional UUID workflowUUID
}

struct DisableAnomalyDetectionForWorkflowRequest {
    1: optional UUID workflowUUID
}

struct DeleteAnomalyDetectionForWorkflowRequest {
    1: optional UUID workflowUUID
}

struct ApproveDenyLinkRequest {
    1: optional UUID targetWorkflowUUID
    2: optional UUID requestUUID
    3: optional bool approved
    4: optional UUID requestingUserUUID
}

struct GetAllOutboundLinksStatusRequest {
    1: optional UUID sourceWorkflowUUID
    2: optional UUID requestingUserUUID
}

struct GetAllIncomingLinksRequest {
    1: optional UUID targetWorkflowUUID
    2: optional UUID requestingUserUUID
}

struct LinkingRequest {
    1: optional UUID targetWorkflowUUID
    2: optional UUID requestUUID
    3: optional UUID targetNodeUUID
    4: optional UUID sourceWorkflowUUID
    5: optional UUID sourceNodeUUID
    6: optional UUID requestingUserUUID
    7: optional string notes
    8: optional DateTime  requestTime
    9: optional list<Condition> conditions
}

struct GetAllIncomingLinksResponse {
    1: optional list<LinkingRequest> pendingLinks
    2: optional list<LinkingRequest> activeLinks
}

struct UserTrait {
    1: required UUID traitUUID
    2: required string name
}

struct LegosSubCondition{
    1: required string name
    2: required string display
    3: required string description
    4: required DataType valueType
}

struct LegosEventCondition {
    1: required i32 id
    2: required string display
    3: required string description
    4: required string audience
    5: required string category
    6: required string topicName
    7: required list<LegosSubCondition> requiredSubConditions
    8: required list<LegosSubCondition> optionalSubConditions
}

struct LegosCondition {
    1: required i32 id
    2: required string display
    3: required string description
    4: required string audience
    5: required string category
    6: optional string topicName
    7: required list<LegosSubCondition> requiredSubConditions
    8: required list<LegosSubCondition> optionalSubConditions
    9: required ConditionType conditionType
}

struct FlushWorkflowUsersRequest {
    1: optional UUID workflowUUID
    2: optional FlushingType flushingType
    3: optional UUID requestingUserUUID
}

struct GetUserWorkflowsRequest {
    1: required UUID userUUID
}

struct GetUserWorkflowsResponse {
    1: required list<UUID> workflowUUIDs
}

struct RegisteredCluster {
    1: required string cluster
    2: required string deployment
}

struct EventDetails {
    1: required i32 id
    2: required string topic
    3: optional string schema
    4: optional list<RegisteredCluster> clusters
}

struct ListRegisteredEventsRequest {
    1: required string environment
}

struct Team {
    1: required UUID id
    2: required string name
}

struct GetAllTeamsRequest {
}

struct GetAllTeamsResponse {
    1: required map<UUID, Team> teams
}

/* TODO: rename it to AudienceType when AudienceType is deprecated */
struct AudienceTypeNew {
    1: required UUID id
    2: required string name
}

struct AudienceMetric {
    1: required UUID id
    2: required string name
    3: required list<UUID> audienceTypeUUIDs
}

struct GetAllAudienceLifecyclesRequest {
}

struct GetAllAudienceLifecyclesResponse {
    1: required map<UUID, AudienceMetric> audienceLifecycles
}

struct GetAllAudienceTopicsRequest {
}

struct GetAllAudienceTopicsResponse {
    1: required map<UUID, AudienceMetric> audienceTopics
}

struct GetAllAudienceTypesRequest {
}

struct GetAllAudienceTypesResponse {
    1: required map<UUID, AudienceTypeNew> audienceTypes
}

struct ProductArea {
    10: required UUID uuid
    20: required string name
    30: optional string description
    40: optional string contactEmail
}

struct GetAllProductAreasRequest {
}

struct GetAllProductAreasResponse {
    10: optional map<UUID, ProductArea> productAreas
}

struct GetProductAreaUUIDsForKpisRequest {
}

struct GetProductAreaUUIDsForKpisResponse {
    10: optional map<string, list<UUID>> kpiToProductAreaUUIDs
}

struct GetKpisForWorkflowsRequest {
    10: optional list<UUID> workflowUUIDs
}

struct KPIVariations {
    10: optional string key
    11: optional list<i32> durations
}

struct GetKpisForWorkflowsResponse {
    10: optional map<UUID, list<string>> workflowUUIDToKpis
    11: optional map<UUID, list<KPIVariations>> kpisPerWorkflowUUID
}

struct CreateMoveUsersJobRequest {
    10: required UUID workflowUUID
    20: optional UUID fromNodeUUID
    30: optional UUID toNodeUUID
}

struct CreateMoveUsersJobResponse
{
    10: required UUID jobUUID
}

struct MoveUsersStatus
{
    10: required UUID jobUUID
    20: required UUID workflowUUID
    30: optional UUID fromNodeUUID
    40: optional UUID toNodeUUID
    50: required string status
    60: required bool done
    70: optional bool succeeded
    80: optional double progress
    90: optional string message
}

struct GetMoveUsersStatusRequest
{
    10: optional UUID workflowUUID
    20: optional UUID fromNodeUUID      // optional, will used for filtering if provided
    30: optional UUID toNodeUUID        // optional, will used for filtering if provided
    40: optional bool includeDismissed  // optional, default false
}

struct GetMoveUsersStatusResponse
{
    10: required list<MoveUsersStatus> status
}

struct DismissMoveUsersStatusRequest
{
    10: required UUID jobUUID          // once dismissed, will not show up when get status by default
}

struct DismissMoveUsersStatusResponse {}


struct CreateAddUsersJobRequest
{
     10: required UUID workflowUUID
     20: optional UUID toNodeUUID // optional, default to the first ingestion node
}
struct CreateAddUsersJobResponse
{
     10: required UUID bulkJobUUID
}
struct CancelBulkJobRequest
{
     10: required UUID bulkJobUUID
}
struct CancelBulkJobResponse {}

struct ActionStagingTestEvent
{
     10: required UUID userUUID
     20: required UUID workflowUUID
}

struct SendActionStagingTestEventsRequest
{
     10: required list<ActionStagingTestEvent> actionStagingTestEvents
}

struct SendActionStagingTestEventsResponse
{
     10: required list<ActionStagingTestEvent> actionStagingTestEvents
}

struct SimulationWorkflowInfo {
    1: required UUID workflowUUID
    2: required UUID flowbulkJobUUID
    3: optional i32 prodWorkflowVersion
    // timestamp uses RFC 3339 format
    4: optional string createdAt
}

struct GetSimulationWorkflowListResponse {
    1: required list<SimulationWorkflowInfo> simulationWorkflowList
}

struct CreateSimulationWorkflowResponse
{
    1: required UUID simulationWorkflowUUID
    2: required UUID flowbulkJobUUID
}

struct CancelSimulationWorkflowRequest
{
    1: required UUID simulationWorkflowUUID
    2: required UUID flowbulkJobUUID
}

struct GetRecommendedComponentsRequest {
    1: required UUID workflowUUID
    2: required UUID userUUID
}

struct GetEventConditionForLegosByIDRequest {
    1: required i32 id
}

struct GetConditionForLegosByIDRequest {
    1: required i32 id
}

struct ConditionInfo {
    1: required i32 id
    2: optional string topicName
}

struct PublishLiveEditRequest {
    1: optional UUID workflowUUID
    2: optional UUID requestingUserUUID
}

struct PublishLiveEditResponse {
    1: optional i32 version
}

struct CancelLiveEditRequest {
    1: optional UUID workflowUUID
    2: optional UUID requestingUserUUID
}

service AutobotsService {
   string hello()
   /*********************************************/
   /***** Workflow CRUD **********************/
   Workflow createWorkflow(1: CreateWorkflowRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
         3: WorkflowValidationError workflowValidationError,
         4: WorkflowEntityError workflowEntityError,
         5: NodeEntityError nodeEntityError,
         6: EdgeEntityError edgeEntityError,
         7: NodeValidationError nodeValidationError,
         8: EdgeValidationError edgeValidationError,
         9: ConditionValidationError conditionValidationError,
         10: TranslationError translationError,
         11: AutobotsInternalError autobotsInternalError,
         12: ExternalDependencyError externalDependencyError,
      )

   Workflow createWorkflowForMigration(1: Workflow request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
         3: WorkflowValidationError workflowValidationError,
         4: AutobotsInternalError autobotsInternalError,
      )

   Workflow getWorkflow(1: UUIDKeyRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: AutobotsInternalError autobotsInternalError,
      )

   GetWorkflowUpdatedAtResult getWorkflowUpdatedAt(1: UUIDKeyRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: AutobotsInternalError autobotsInternalError,
      ) (cerberus.enabled = "true", cerberus.type = "read")

   Workflow copyWorkflow(1: UUIDKeyRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: AutobotsInternalError autobotsInternalError,
      )

   void deleteWorkflow(1: DeleteWorkflowRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: AutobotsInternalError autobotsInternalError,
      )

   Workflow editCreatedByForWorkflow(1:EditCreatedByForWorkflowRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: AutobotsInternalError autobotsInternalError,
      )

   Workflow editNameForWorkflow(1:EditNameForWorkflowRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: AutobotsInternalError autobotsInternalError,
      )

   void setUserReentryForWorkflow(1:SetUserReentryRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: WorkflowValidationError workflowValidationError,
         4: AutobotsInternalError autobotsInternalError,
         )

   Workflow editTypeForWorkflow(1:EditTypeForWorkflowRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: AutobotsInternalError autobotsInternalError,
      )

   Workflow editStatusForWorkflow(1:EditStatusForWorkflowRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,

         3: WorkflowValidationError workflowValidationError,
         4: WorkflowEntityError workflowEntityError,
         5: NodeEntityError nodeEntityError,
         6: EdgeEntityError edgeEntityError,
         7: NodeValidationError nodeValidationError,
         8: EdgeValidationError edgeValidationError,
         9: ConditionValidationError conditionValidationError,
         10: TranslationError translationError,
         11: AutobotsInternalError autobotsInternalError,
         12: ExternalDependencyError externalDependencyError,

         13: EntityNotExistsError entityNotExistsError,
      )

    void setIsCriticalWorkflow(1:SetIsCriticalRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: WorkflowValidationError workflowValidationError,
         4: AutobotsInternalError autobotsInternalError,
         )

   /***** Node CUD **********************/
   Workflow addNodeToWorkflow(1: AddNodeToWorkflowRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,

         4: WorkflowValidationError workflowValidationError,
         5: NodeEntityError nodeEntityError,
         6: NodeValidationError nodeValidationError,
         7: AutobotsInternalError autobotsInternalError,
         8: ExternalDependencyError externalDependencyError,
         9: TranslationError translationError,
      )

   Node addEdgeBetweenNodes(1: AddEdgeBetweenNodesRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: EdgeEntityError edgeEntityError,
         6: EdgeValidationError edgeValidationError,
         7: AutobotsInternalError autobotsInternalError,
         8: ExternalDependencyError externalDependencyError,
         9: TranslationError translationError,
      )

   Node addActionToNode(1: AddActionToNodeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: NodeEntityError nodeEntityError,
         6: NodeValidationError nodeValidationError,
         7: AutobotsInternalError autobotsInternalError,
         8: TranslationError translationError,
         9: ExternalDependencyError externalDependencyError,
      )

   /**** editActions should handler editing and deleting action ****/
   Node editActionsForNode(1: EditActionsForNodeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: AutobotsInternalError autobotsInternalError,
         9: TranslationError translationError,
         10: WriteConflictError writeConflictError,
      )

   void sendActionsToMe(1: SendActionsToMeRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

    void runWorkflowCleanUpService(1: CleanupWorkflowsRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   Node editPriorityForEdge(1: EditPriorityForEdgeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: WriteConflictError writeConflictError,
      )

   Node addConditionToEdge(1: AddConditionToEdgeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   Workflow addPreConditionsToWorkflow(1: AddPreConditionsToWorkflowRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   Workflow addExitEdge(1: AddExitEdgeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   Workflow deleteExitEdge(1: DeleteExitEdgeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   /**** editConditions should handler editing and deleting conditions ****/
   Node editConditionsForEdge(1: EditConditionsForEdgeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: WriteConflictError writeConflictError,
      )

   /**** Ingestion CRUD ****/
   Workflow createIngestion(1: CreateIngestionRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   Workflow updateIngestion(1: UpdateIngestionRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   void deleteIngestion(1: DeleteIngestionRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   /**** editPreConditions should handler editing and deleting Preconditions ****/
   Workflow editPreConditionsForWorkflow(1: EditPreConditionsForWorkflowRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: WriteConflictError writeConflictError,
      )

   Node editMetaForNode(1: EditMetaForNodeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: WriteConflictError writeConflictError,
      )

   void deleteNode(1: DeleteNodeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: WriteConflictError writeConflictError,
      )

   void deleteEdge(1: DeleteEdgeRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
         5: WriteConflictError writeConflictError,
      )

   void subscribeUsersForWorkflows(1: SubscribeUsersForWorkflowsRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   void unsubscribeUsersForWorkflows(1: UnsubscribeUsersForWorkflowsRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   GetSubscriptionsForUserResult getSubscriptionsForUser(1: GetSubscriptionsForUserRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      )


   ListWorkflowResult listWorkflowByStatus(1: ListWorkflowByStatusRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   ListWorkflowResult listWorkflowMeta(1: ListWorkflowMetaRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   ListWorkflowResult listWorkflowByType(1: ListWorkflowByTypeRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   ListWorkflowWithExperimentResponse  listWorkflowWithExperiment(1: ListWorkflowWithExperimentRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   map<string, string>  getWorkflowMeta(1: UUIDKeyRequest request)
      throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      )

   map<string, string> setWorkflowMeta(1: WorkflowMetaRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   WorkflowDetails getWorkflowDetails(1: UUIDKeyRequest request)
      throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      ) (cerberus.enabled = "true", cerberus.type = "read")

   WorkflowDetails createWorkflowDetails(1: CreateWorkflowDetailsRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      ) (cerberus.enabled = "true", cerberus.type = "write")

   // DEPRECATED Use searchWorkflows
   ListWorkflowResult searchWorkflow(1: SearchWorkflowRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   ListWorkflowResult searchWorkflows(1: SearchWorkflowsRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   /* return updated and complete Details */
   WorkflowDetails updateWorkflowDetails(1: UpdateWorkflowDetailsRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      ) (cerberus.enabled = "true", cerberus.type = "write")

   string getConditionTemplates(1: EmptyRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   list<ConditionInfo> getConditionInfoList(1: EmptyRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      ) (cerberus.enabled = "true", cerberus.type = "read")

   bool validateGraph(1: UUIDKeyRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

   map<i32, string> getAvailableTargetTypes(1: EmptyRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   void flushWorkflowUsers(1: FlushWorkflowUsersRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      )

   void logAllWorkflowMeta(1: EmptyRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      )

   GetUserStateResult getUserState(1: GetUserStateRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      )

   void enableAnomalyDetectionForWorkflow(1: EnableAnomalyDetectionForWorkflowRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   void disableAnomalyDetectionForWorkflow(1: DisableAnomalyDetectionForWorkflowRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   void deleteAnomalyDetectionForWorkflow(1: DeleteAnomalyDetectionForWorkflowRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
      )

   void approveDenyLinkRequest(1: ApproveDenyLinkRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      )

   GetAllIncomingLinksResponse getAllIncomingLinks(1: GetAllIncomingLinksRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      )

   map<string, LinkingStatus> getAllOutboundLinksStatus(1: GetAllOutboundLinksStatusRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
      )

   list<UserTrait> getAllTraitTypes()
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   list<LegosEventCondition> getAllEventConditionsForLegos()
     throws(
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     ) (cerberus.enabled = "true", cerberus.type = "read")

   LegosEventCondition getEventConditionForLegosByID(1: required GetEventConditionForLegosByIDRequest request)
     throws(
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     ) (cerberus.enabled = "true", cerberus.type = "read")


    list<LegosCondition> getAllConditionsForLegos()
     throws(
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     ) (cerberus.enabled = "true", cerberus.type = "read")

   LegosCondition getConditionForLegosByID(1: required GetConditionForLegosByIDRequest request)
     throws(
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     ) (cerberus.enabled = "true", cerberus.type = "read")

    GetUserWorkflowsResponse getUserWorkflows(1: GetUserWorkflowsRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    GetAllProductAreasResponse getAllProductAreas (1: required GetAllProductAreasRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    ) (cerberus.enabled = "true", cerberus.type = "read")

    GetProductAreaUUIDsForKpisResponse getProductAreaUUIDsForKpis (1: required GetProductAreaUUIDsForKpisRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    GetKpisForWorkflowsResponse getKpisForWorkflows(1: required GetKpisForWorkflowsRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    GetAllTeamsResponse getAllTeams (1: required GetAllTeamsRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    ) (cerberus.enabled = "true", cerberus.type = "read")

    GetAllAudienceLifecyclesResponse getAllAudienceLifecycles (1: required GetAllAudienceLifecyclesRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    ) (cerberus.enabled = "true", cerberus.type = "read")

    GetAllAudienceTopicsResponse getAllAudienceTopics (1: required GetAllAudienceTopicsRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    ) (cerberus.enabled = "true", cerberus.type = "read")

    GetAllAudienceTypesResponse getAllAudienceTypes (1: required GetAllAudienceTypesRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    ) (cerberus.enabled = "true", cerberus.type = "read")

    list<EventDetails> listRegisteredEvents(1: required ListRegisteredEventsRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    CreateMoveUsersJobResponse createMoveUsersJob(1: required CreateMoveUsersJobRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    GetMoveUsersStatusResponse getMoveUsersStatus(1: required GetMoveUsersStatusRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    ) (cerberus.enabled = "true", cerberus.type = "read")

    DismissMoveUsersStatusResponse dismissMoveUsersStatus(1: required DismissMoveUsersStatusRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    CreateAddUsersJobResponse createAddUsersJob(1: required CreateAddUsersJobRequest request)
         throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )
    CancelBulkJobResponse cancelBulkJob(1: required CancelBulkJobRequest request)
         throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    /* Send action staging test mode event */
    SendActionStagingTestEventsResponse sendActionStagingTestEvents(1: required SendActionStagingTestEventsRequest request)
         throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )


    /* Send the condition edit events */
    bool sendConditionSelectionEvents()
         throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    GetSimulationWorkflowListResponse getSimulationWorkflowList(1: UUIDKeyRequest request)
         throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    CreateSimulationWorkflowResponse createSimulationWorkflow(1: UUIDKeyRequest request)
         throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    void startSimulationWorkflow(1: UUIDKeyRequest request)
         throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    void cancelSimulationWorkflow(1: CancelSimulationWorkflowRequest request)
         throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    )

    string getRecommendedComponents(1: GetRecommendedComponentsRequest request)
        throws (
            1: BadRequestError requestError,
            2: InternalServerError internalServerError,
    ) (cerberus.enabled = "true", cerberus.type = "read")

    PublishLiveEditResponse publishLiveEdit(1: PublishLiveEditRequest request)
     throws (
         1: EntityNotExistsError entityNotExistsError,
         2: BadRequestError requestError,
         3: InternalServerError internalServerError,
         4: WorkflowValidationError workflowValidationError,
      )

    void cancelLiveEdit(1: CancelLiveEditRequest request)
        throws (
            1: EntityNotExistsError entityNotExistsError,
            2: BadRequestError requestError,
            3: InternalServerError internalServerError,
    )
}

struct NodeInsightEdge {
    1: optional UUID edgeUUID
    2: optional UUID fromNodeUUID
    3: optional UUID toNodeUUID
}

struct NodeInsight {
    1: optional UUID nodeUUID
    2: optional i32 userEntryCount
    3: optional map<UUID, NodeInsightEdge> edges
}

struct CreateReportTimerRequest {
    1: optional string reportType
}

struct CreateReportTimerResponse {
    1: optional UUID uuid
    2: optional string reportType
}

struct RemoveReportTimerRequest {
    1: optional string reportType
}

struct GetNodeUserEntryRequest {
    1: optional UUID nodeUUID
    2: optional UUID workflowUUID
    3: optional UserEntryCountType type
    4: optional UUID optionalEdgeUUID
}

struct GetNodeUserExitRequest {
    1: optional UUID workflowUUID
    2: optional UUID optionalNodeUUID
    3: optional UUID optionalEdgeUUID
    4: optional UserEntryCountType type
}

struct GetWorkflowCostRequest {
    1: optional UUID workflowUUID
    2: optional string fromDate
    3: optional string toDate
}

struct GetWorkflowInsightRequest {
    1: optional UUID workflowUUID
    2: optional string fromDate
    3: optional string toDate
}

struct GetNodeUserEntryResponse {
    1: optional i32 count
    2: optional string since
    3: optional list<UUID> sampleUsers
}

struct GetWorkflowCostResponse {
    1: optional UUID workflowUUID
    2: optional map<string, string> metrics
    3: optional map<string, double> dataPoints
}

struct GetWorkflowInsightResponse {
    1: optional UUID workflowUUID
    2: optional map<UUID, NodeInsight> nodeInsights
}

struct GetWorkflowEntryViewRequest {
    1: optional UUID workflowUUID
    2: optional string fromDate
    3: optional string toDate
}

struct GetWorkflowEntryViewResponse {
    1: optional map<string, list<i32>> view
}

struct GetWorkflowExitViewRequest {
    1: optional UUID workflowUUID
    2: optional string fromDate
    3: optional string toDate
}

struct GetWorkflowExitViewResponse {
    1: optional map<string, list<i32>> view
}

struct GetWorkflowStayViewRequest {
    1: optional UUID workflowUUID
    2: optional string fromDate
    3: optional string toDate
}

struct GetWorkflowStayViewResponse {
    1: optional map<string, list<i32>> view
}

struct GetWorkflowActionViewRequest {
    1: optional UUID workflowUUID
    2: optional ActionType actionType
    3: optional ViewType viewType
    4: optional string fromDate
    5: optional string toDate
}

struct GetNodeInsightsDownloadRequest {
    1: optional UUID workflowUUID
    2: optional UUID nodeUUID
    3: optional NodeUserFlowType type
    4: optional string fromDate
    5: optional string toDate
}

struct WorkflowActionView {
    1: optional string nodeName
    2: optional string nodeUUID
    3: optional string actionView
}

struct GetWorkflowActionViewResponse {
    1: optional list<WorkflowActionView> view
}

struct StoreBackfillWorkflowUUIDsRequest {
    1: optional string backfillEndTime
}

struct GetNodeInsightsDownloadResponse {
    1: optional NodeUserFlowType type
    2: optional string fromDate
    3: optional string toDate
    4: optional i32 count
    5: optional string downloadURL
}

struct BackfillOnNodeUserRequest {
    1: optional UUID requestingUserUUID
    2: optional string backfillEndTime
    3: optional list<i32> indexes
    4: optional bool clearTable
}

struct BackfillOnNodeUserResponse {
    1: optional list<i32> todo
}

struct FlowStoreCallbackResponse {
    1: required map<string, string> responsedFields
}

struct FlowStoreCallbackRequest {
    1: required string instanceName
    2: required UUID userUUID
    3: required list<string> requestedFields
}

service FlowStoreCallback {
   FlowStoreCallbackResponse callback(1: FlowStoreCallbackRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
       )
}

service AutobotsAnalyticsService {
   CreateReportTimerResponse createReportTimer(1: CreateReportTimerRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   void removeReportTimer(1: RemoveReportTimerRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   GetNodeUserEntryResponse getNodeUserEntry(1: GetNodeUserEntryRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   GetNodeUserEntryResponse getNodeUserExit(1: GetNodeUserExitRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   GetWorkflowInsightResponse getWorkflowInsight(1: GetWorkflowInsightRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   GetWorkflowCostResponse getWorkflowCost(1: GetWorkflowCostRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   GetWorkflowEntryViewResponse getWorkflowEntryView(1: GetWorkflowEntryViewRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   GetWorkflowExitViewResponse getWorkflowExitView(1: GetWorkflowExitViewRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   GetWorkflowStayViewResponse getWorkflowStayView(1: GetWorkflowStayViewRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   GetWorkflowActionViewResponse getWorkflowActionView(1: GetWorkflowActionViewRequest request)
     throws (
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   void storeBackfillWorkflowUUIDs(1: StoreBackfillWorkflowUUIDsRequest request)
     throws(
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )

   BackfillOnNodeUserResponse backfillOnNodeUser(1: BackfillOnNodeUserRequest request)
     throws (
         1: InternalServerError internalServerError,
     )

   GetNodeInsightsDownloadResponse getNodeInsightsDownloadURL(1: GetNodeInsightsDownloadRequest request)
     throws(
         1: BadRequestError requestError,
         2: InternalServerError internalServerError,
     )
}

struct ActionDetails {
    1: optional i32 id
    2: optional string name
    3: optional string source
}

struct Event {
    1: required i32 id
    2: required string eventJSON
}

struct DecodeEventRequest {
    1: required Event event
    2: required string environment
}

struct MockGatewayCall {
    1: required string name
    2: required list<string> inputs
    3: required list<string> outputs
}

struct EvaluateConditionRequest {
    1: required Condition condition
    2: required string environment
    3: optional Event event
    4: optional string userUUID
    5: optional list<MockGatewayCall> mockGatewayCalls
    6: optional string ctxJSON
}

struct ParamEvaluation {
    1: required string key
    2: required string operator
    3: required string value
    4: required string actual
    5: required bool res
    6: optional string error
}

struct EvaluateConditionResponse {
    1: required bool res
    2: optional list<ParamEvaluation> paramEvals
    3: optional string user
}

/** CLITools service can only be called from a goautobots app that is ran locally **/
service CLITools {
  string hello()

  list<EventDetails> getRegisteredEvents()
    throws (
      1: InternalServerError internalServerError,
    )

  list<ActionDetails> getRegisteredActions()
    throws (
      1: InternalServerError internalServerError,
    )

  /** getConditionTemplates is identical to the method in the Autobots service **/
  string getConditionTemplates()
    throws (
        1: InternalServerError internalServerError,
     )

  string decodeEvent(1: DecodeEventRequest request)
    throws (
      1: InternalServerError internalServerError,
    )

  EvaluateConditionResponse evaluateCondition(1: EvaluateConditionRequest request)
    throws (
      1: InternalServerError internalServerError,
      2: BadGatewayCallError badGatewayCallError,
      3: ConditionValidationError conditionValidationError,
      4: TranslationError translationError,
      5: ExternalDependencyError externalDependencyError,
      6: AutobotsInternalError autobotsInternalError,
    )
}
